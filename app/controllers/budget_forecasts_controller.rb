class BudgetForecastsController < ApplicationController

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def new_comment
    values = new_comment_params
    @comment = BudgetForecastComment.create(budget_forecast_id: values['bf_id'], user: current_user, year: values['year'], comment: values['comment'])
    render 'pdsis/projecao_orcamentaria/new_comment', layout: false
  end

  def see_comment
    comment = BudgetForecastComment.find params['comment']
    render json: { status: comment.user_saw(current_user) }
  end

  def delete_comment
    values = delete_comment_params
    BudgetForecastComment.find(values['id']).destroy
    render json: { status: true }
  end

  private
    def new_comment_params
      params.require(:comment).permit(:bf_id, :year, :comment)
    end

    def delete_comment_params
      params.require(:comment).permit(:id)
    end
end