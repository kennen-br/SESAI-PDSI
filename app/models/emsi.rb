class Emsi < ActiveRecord::Base
  auditable

  belongs_to :base_polo
  belongs_to :pdsi

  validates :name, length: { maximum: 255 }, presence: true
  validates_presence_of :numero_medicos,
                        :numero_enfermeiros,
                        :numero_odontologistas,
                        :numero_tecnicos_enfermagem,
                        :asb,
                        :ais,
                        :aisan,
                        :aldeias_atendidas,
                        :permanencia_medicos,
                        :permanencia_enfermeiros,
                        :permanencia_odontologistas,
                        :permanencia_tecnicos_enfermagem
end

