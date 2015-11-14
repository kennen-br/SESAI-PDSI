class ResponsabilityComment < ActiveRecord::Base
  belongs_to :responsability
  belongs_to :user
end
