class InvestmentItem < ActiveRecord::Base
  belongs_to :budget_investment

  validates_presence_of :city, :village, :pole_base
end
