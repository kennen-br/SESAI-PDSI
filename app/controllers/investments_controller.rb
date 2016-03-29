class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:show, :edit, :update, :destroy]
  before_action :set_investments, only: [:index, :show, :edit]

  def index; end

  def show; end

  def edit; end

  def update
    if @investment.update(investment_params)
      redirect_to investments_url, notice: 'Investimento atualizado com sucesso.'
    else
      render :edit
    end
  end

  private

  def set_investment
    @investment = Investment.find(params[:id])
  end

  def set_investments
    @investments = Investment.all.order(:id)
  end

  def investment_params
    params.require(:investment).permit(:id, :tooltip)
  end
end
