class ResultsController < ApplicationController
  before_action :check_sesai_central_actions#,  only: [:index, :edit, :update]
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  def index
    @items  = ResultAxis.all.order(:id).includes(:result_strategies)
  end

  # GET /results/1
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  def create
    @result = Result.new(result_params)

    if @result.save
      redirect_to results_path, notice: 'Resultado cadastrado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /results/1
  def update
    if @result.update(result_params)
      redirect_to results_path, notice: 'Resultado atualizado com sucesso.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def result_params
      params.require(:result).permit(:result_level, :result_strategy_id, :name, :reference_value, :parent_id_id, :is_specific, :is_percentage, :result_text)
    end
end
