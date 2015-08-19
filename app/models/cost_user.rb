class CostUser < ActiveRecord::Base
  belongs_to :cost
  belongs_to :user

  validates :cost,        presence: true
  validates :user,        presence: true
  validates :value_2015,  numericality: { only_integer: false } 
  validates :value_2016,  numericality: { only_integer: false }
  validates :reason,      presence: true
  validates :criteria,    presence: true
end
