class PdsiHumanResource < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :human_resource_function, inverse_of: :pdsi_human_resources

  validates :human_resource_function, :pdsi, presence: true
end
