class CategoryBudgetsController < ApplicationController
  before_action :check_sesai_central_actions

  def index
    @dseis  = Dsei.order(:name)
  end
end
