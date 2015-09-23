class CapaiVillage < ActiveRecord::Base
  auditable

  belongs_to :capai
  belongs_to :village
end
