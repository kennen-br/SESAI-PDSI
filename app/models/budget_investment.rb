class BudgetInvestment < ActiveRecord::Base
  belongs_to :investment

  def self.find_by_investment(id)
    where(investment_id: id)
  end
end
