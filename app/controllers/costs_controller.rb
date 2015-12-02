class CostsController < ApplicationController
  before_action :set_cost, only: [:show, :edit, :update, :destroy]

  #GET /costs
  def index
  	@costs = Cost.all
  end

  # GET /costs/1
  def show
  end

  # GET /costs/new
  def new
    @cost = Cost.new
  end

  # GET /costs/1/edit
  def edit
  end

  # POST /costs
  def create
    @cost = Cost.new(cost_params)
    if @cost.save
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
      params.require(:cost).permit(:name, :parent_id, :cost_type, :data_type)
    end

end
