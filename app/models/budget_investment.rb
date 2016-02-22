class BudgetInvestment < ActiveRecord::Base
  belongs_to :investment

  def self.find_by_investment(id)
    where(investment_id: id)
  end

  has_many  :investment_items
  has_many  :budget_investment_comments, :dependent => :destroy

  accepts_nested_attributes_for :investment_items,
                                reject_if: lambda { |attr| attr[:name].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :budget_investment_comments, reject_if: :all_blank, allow_destroy: true

  def comments_by_year(year)
    self.budget_investment_comments.where(year: year)
  end

  def last_comment
    budget_investment_comments.last
  end
end
