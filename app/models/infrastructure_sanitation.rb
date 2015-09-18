class InfrastructureSanitation < ActiveRecord::Base
  belongs_to :pdsi
  belongs_to :village

  validates :pdsi_id,             presence: true
  validates :village_id,          presence: true
  validates :qtd_msd_individual,  numericality: { only_integer: true, allow_nil: true }
  validates :qtd_msd_coletiva,    numericality: { only_integer: true, allow_nil: true }
end
