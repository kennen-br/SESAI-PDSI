class BudgetInvestmentsController < ApplicationController
  def new_comment
    values = new_comment_params
    @comment = BudgetInvestmentComment.create(budget_investment_id: values['budget_id'],
                                              user: current_user, year: values['year'],
                                              comment: values['comment'])

    render 'pdsis/projecao_orcamentaria/new_comment', layout: false
  end

  def see_comment
    comment = BudgetInvestmentComment.find params['comment']
    render json: { status: comment.user_saw(current_user) }
  end

  def delete_comment
    values = delete_comment_params
    BudgetInvestmentComment.find(values['id']).destroy
    render json: { status: true }
  end

  private

  def new_comment_params
    params.require(:comment).permit(:budget_id, :year, :comment)
  end

  def delete_comment_params
    params.require(:comment).permit(:id)
  end
end
