class BudgetInvestment < ActiveRecord::Base
  belongs_to :investment

  has_many :investment_items
  accepts_nested_attributes_for :investment_items,
                                reject_if: -> (attr) { attr[:name].blank? },
                                allow_destroy: true

  has_many :budget_investment_comments, dependent: :destroy
  accepts_nested_attributes_for :budget_investment_comments, reject_if: :all_blank, allow_destroy: true

  has_many :budget_justifiers, dependent: :destroy
  accepts_nested_attributes_for :budget_justifiers, reject_if: :all_blank, allow_destroy: true

  def self.find_by_investment(id)
    where(investment_id: id)
  end

  def comments_by_year(year)
    budget_investment_comments.where(year: year)
  end

  def justifiers_by_year(year)
    budget_justifiers.where(year: year)
  end

  def last_comment
    budget_investment_comments.last
  end

  def with_justifier(id)
    budget_justifiers.where(budget_investment_id: id).first_or_create
  end
end
