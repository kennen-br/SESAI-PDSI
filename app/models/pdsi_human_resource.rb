class PdsiHumanResource < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :human_resource_function, inverse_of: :pdsi_human_resources

  validates_presence_of :sead_necessaria,
                        :selog_necessaria,
                        :sesane_necessaria,
                        :seofi_necessaria,
                        :sgep_necessaria,
                        :gabinete_necessaria,
                        :diasi_necessaria,
                        :ubsi_necessaria,
                        :polo_base_tipo_1_necessaria,
                        :polo_base_tipo_2_necessaria,
                        :casai_necessaria
end
