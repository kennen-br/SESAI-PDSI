class Transportation < ActiveRecord::Base
  auditable

  belongs_to :demographic_data

  validates :name, uniqueness: { scope: :demographic_data }#, presence: true
end
