class BudgetCorrectionFactorsController < ApplicationController
  before_action :set_budget_correction_factor, only: [:show, :edit, :update, :destroy]

  # GET /budget_correction_factors
  def index
    @budget_correction_factors = BudgetCorrectionFactor.all
  end

  # GET /budget_correction_factors/1
  def show
  end

  # GET /budget_correction_factors/new
  def new
    @budget_correction_factor = BudgetCorrectionFactor.new
  end

  # GET /budget_correction_factors/1/edit
  def edit
  end

  # POST /budget_correction_factors
  def create
    @budget_correction_factor = BudgetCorrectionFactor.new(budget_correction_factor_params)

    if @budget_correction_factor.save
      redirect_to @budget_correction_factor, notice: 'Budget correction factor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /budget_correction_factors/1
  def update
    if @budget_correction_factor.update(budget_correction_factor_params)
      redirect_to @budget_correction_factor, notice: 'Budget correction factor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /budget_correction_factors/1
  def destroy
    @budget_correction_factor.destroy
    redirect_to budget_correction_factors_url, notice: 'Budget correction factor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_correction_factor
      @budget_correction_factor = BudgetCorrectionFactor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def budget_correction_factor_params
      params[:budget_correction_factor]
    end
end
