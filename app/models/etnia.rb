class Etnia < ActiveRecord::Base
  auditable

  self.table_name  = 'etnias'

  belongs_to :demographic_data

  validates :name, uniqueness: { scope: :demographic_data }#, presence: true
end
