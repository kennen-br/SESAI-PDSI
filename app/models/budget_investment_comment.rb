class BudgetInvestmentComment < ActiveRecord::Base
  belongs_to :budget_investment
  belongs_to :user

  def seen_by_user?(visitor)
    return true if visitor.id == user.id

    return eval(users).include?(visitor.id) ? true : false
  end

  def user_saw(visitor)
    return if seen_by_user?(visitor)

    a_users = eval(users)
    a_users << visitor.id

    update users: a_users.to_s
  end
end
