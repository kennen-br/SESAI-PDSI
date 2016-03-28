class CostsController < ApplicationController
  before_action :set_cost, only: [:show, :edit, :update, :destroy]

  #GET /costs
  def index
  	@costs = Cost.all.order(:id)
  end

  # GET /costs/1
  def show
    @costs = Cost.all.order(:id)
    @parent_costs = Array.new
    @costs.each do |cost|
      unless cost.cost_type == 3 || !cost.cost_type
        @parent_costs << cost
      end
    end
  end

  # GET /costs/new
  def new
    @cost = Cost.new
    @costs = Cost.all.order(:id)
    @parent_costs = Array.new
    @costs.each do |cost|
      unless cost.cost_type == 3 || !cost.cost_type
        @parent_costs << cost
      end
    end
  end

  # GET /costs/1/edit
  def edit
    @costs = Cost.all.order(:id)
    @parent_costs = Array.new
    @costs.each do |cost|
      unless cost.cost_type == 3 || !cost.cost_type
        @parent_costs << cost
      end
    end
  end

  # POST /costs
  def create
    @cost = Cost.new(cost_params)
    @cost.id = Cost.last.id+1
    if @cost.save
      Pdsi.all.each do |pdsi|
        @budget_forecast = BudgetForecast.new(id: (BudgetForecast.last.id+1), cost_id: @cost.id, pdsi_id: pdsi.id)
        @budget_forecast.save
      end
      #redirect_to @cost, notice: 'Cost was successfully created.'
      redirect_to costs_url
    else
      render :new
    end
  end

  # PATCH/PUT /costs/1
  def update
    if @cost.update(cost_params)
      #redirect_to @cost, notice: 'Cost was successfully updated.'
      redirect_to costs_url, notice: 'Custo atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /costs/1
  def destroy
    @cost.destroy
    redirect_to costs_url, notice: 'Custo foi destruído com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost
      @cost = Cost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cost_params
      params.require(:cost).permit(:id, :name, :parent_id, :cost_type, :data_type, :tooltip)
    end

end
