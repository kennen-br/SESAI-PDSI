class Person < ActiveRecord::Base
  auditable
  after_save :current_resource

  belongs_to :pdsi
  belongs_to :dsei
  has_many :responsabilities
  belongs_to :human_resource_function

  validates :name, length: { mininum: 3, maximum: 255 }, uniqueness: { scope: :dsei }, presence: true

  scope :sesai_people, -> { where(is_sesai_central: true) }

  def bond_selection
    {
      'CONVENIADA' => 'CONVÊNIO',
      'PROJETO MAIS MÉDICOS - PMM' => 'PMM/PROVAB',
      'ATIVO PERMANENTE' => 'SESAI/DSEI',
      'CEDIDO MUNICÍPIO' => 'CEDIDO MUNICÍPIO',
      'CEDIDO ESTADO' => 'CEDIDO ESTADO',
      'CEDIDO ÓRGÃO FEDERAL' => 'CEDIDO ÓRGÃO FEDERAL',
      'CEDIDO SUS/LEI Nº 8.270' => 'SESAI/DSEI',
      'CONTRATO TEMPORÁRIO DA UNIÃO' => 'SESAI/DSEI',
      'EXERC.§7º ART. 93 DA LEI Nº 8.112' => 'SESAI/DSEI',
      'EXERCÍCIO DESCENTRALIZADO DE CARREIRA' => 'SESAI/DSEI',
      'NOMEADO CARGO COMISSIONADO' => 'SESAI/DSEI',
      'REQUISITADO DE OUTROS ÓRGÃOS' => 'SESAI/DSEI',
      'TERCEIRIZADOS' => 'TERCEIRIZADOS'
    }
  end

  private

  def current_resource
    resources = Person.where(pdsi: pdsi)
                      .pluck(:human_resource_function_id, :workplace)
                      .map.reject { |a| a[0].blank? || a[1].blank? }
                      .map(&:reverse)
                      .each_with_object(Hash.new(0)) { |k, v| v[k] += 1 }
                      .to_a
    update_resources(resources)
  end

  def update_resources(resources)
    resources.each do |r|
      current = r[0][0].downcase.split(' ').push('atual').join('_')
      resource = r[0][1]
      value = r[1]
      hr = PdsiHumanResource.where(pdsi: pdsi, human_resource_function_id: resource).first
      hr.update_attributes(current.to_sym => value)
    end
  end
end
