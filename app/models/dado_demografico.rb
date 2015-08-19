class DadoDemografico < ActiveRecord::Base
  belongs_to :pdsi

  validates :extensao_territorial,  length: { maximum: 255 }, presence: false
  validates :municipio_sede,        length: { maximum: 255 }, presence: false
  validates :endereco,              length: { maximum: 255 }, presence: false
  validates :email,                 email: true

  # TODO: Não dá erro quando salva não número, mas quando salva número passa.
  validates :numero_municipios,       numericality: { only_integer: true, allow_nil: true }
  validates :populacao_indigena,      numericality: { only_integer: true, allow_nil: true }
  validates :numero_polos_base,       numericality: { only_integer: true, allow_nil: true }
  validates :numero_ubsi,             numericality: { only_integer: true, allow_nil: true }
  validates :numero_regioes_de_saude, numericality: { only_integer: true, allow_nil: true }
  validates :numero_casais,           numericality: { only_integer: true, allow_nil: true }
  validates :numero_aldeias,          numericality: { only_integer: true, allow_nil: true }
  validates :numero_familias,         numericality: { only_integer: true, allow_nil: true }
end
