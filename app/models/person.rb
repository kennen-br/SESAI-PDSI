class Person < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :dsei
  has_many  :responsabilities
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

end
