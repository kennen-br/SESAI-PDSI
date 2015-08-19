class CostUsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token

  # GET /cost_users
  def index
    @items  = CostUser.where(user: current_user).includes(:cost)
  end

  # GET /cost_users/1/edit
  def edit
    @costs  = Cost.all
  end

  # PATCH/PUT /cost_users/1
  def update
    render text: "foo"
=begin
    if @cost_user.update(cost_user_params)
      redirect_to @cost_user, notice: 'Cost user was successfully updated.'
    else
      render :edit
    end
=end
  end
end
