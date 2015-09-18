class Pdsi < ActiveRecord::Base
  attr_accessor :dsei

  belongs_to  :user

  has_one :demographic_data
  accepts_nested_attributes_for :demographic_data

  has_many  :physiographic_datas
  accepts_nested_attributes_for :physiographic_datas, reject_if: :all_blank, allow_destroy: true

  has_many  :pdsi_base_polo_data
  accepts_nested_attributes_for :pdsi_base_polo_data, reject_if: :all_blank, allow_destroy: true

  has_many  :emsis
  accepts_nested_attributes_for :emsis, reject_if: :all_blank, allow_destroy: true

  has_many  :service_networks
  accepts_nested_attributes_for :service_networks, reject_if: :all_blank, allow_destroy: true

  has_many  :infrastructure_buildings
  accepts_nested_attributes_for :infrastructure_buildings, reject_if: :all_blank, allow_destroy: true

  has_many  :infrastructure_sanitations
  accepts_nested_attributes_for :infrastructure_sanitations, reject_if: :all_blank, allow_destroy: true

  has_many  :capais
  accepts_nested_attributes_for :capais, reject_if: :all_blank, allow_destroy: true

  has_many  :destinations
  accepts_nested_attributes_for :destinations, reject_if: :all_blank, allow_destroy: true

  has_attached_file :map, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :map, content_type: /\Aimage\/.*\Z/

  attr_accessor :text_template

  def dsei
    return @dsei unless @dsei.nil?

    @dsei = user.dsei
  end

  def text_template
    return @text_template unless @text_template.nil?

    @text_template = TextTemplate.first
  end

  def demographic_data
    return @demographic_data unless @demographic_data.nil?

    @demographic_data = DemographicData.first_or_create pdsi: self
  end

  def sample(attr)
    eval "text_template.#{attr}"
  end

  def introducao_1
    compose_item :introducao_1, '[NOME_DSEI]', user.profile.name
  end

  def compose_item_2
    return if processo_construcao_pdsi_2.blank?

    compose_item :processo_construcao_pdsi_2, '[PARAGRAFO_DSEI]', processo_construcao_pdsi_2
  end

  def compose_item_3
    caracterizacao_do_dsei_3
  end

  def destinations_with_villages
    DestinationType.eager_load(destinations: [:origin_village, :destination_village]).where('destinations.pdsi_id = ?', id)
  end

private
  def compose_item(sample_attr, key, value)
    default = sample(sample_attr)

    return if default.nil?

    default.gsub key, value
  end
end
