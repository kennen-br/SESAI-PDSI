class InfrastructureSanitation < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :village

  validates :village_id, presence: true, uniqueness: { message: "Aldeia Já inclusa" }
  validates_presence_of :pdsi_id,
                        :qtd_msd_individual,
                        :qtd_msd_coletiva,
                        :tipo_captacao_agua,
                        :nome_concessionaria,
                        :abastecimento_mqa,
                        :qtd_msd_individual,
                        :nome_saa
end
