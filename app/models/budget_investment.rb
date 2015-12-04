class BudgetInvestment < ActiveRecord::Base
  belongs_to :investment

  def self.find_by_investment(id)
    where(investment_id: id)
  end

  has_many  :investment_items
  accepts_nested_attributes_for :investment_items, reject_if: :all_blank, allow_destroy: true
end
