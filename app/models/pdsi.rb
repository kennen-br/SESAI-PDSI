class Pdsi < ActiveRecord::Base
  belongs_to  :user

  has_one :dado_demografico
  accepts_nested_attributes_for :dado_demografico

  has_attached_file :map, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :map, content_type: /\Aimage\/.*\Z/

  attr_accessor :text_template

  def text_template
    return @text_template unless @text_template.nil?

    @text_template = TextTemplate.first
  end

  def dado_demografico
    return @dado_demografico unless @dado_demografico.nil?

    @dado_demografico = DadoDemografico.first_or_create pdsi: self
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

private
  def compose_item(sample_attr, key, value)
    default = sample(sample_attr)

    return if default.nil?

    default.gsub key, value
  end
end