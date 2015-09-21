class AbsoluteDataController < ApplicationController
  before_action :check_sesai_central_actions
  before_action :set_absolute_datum, only: [:edit, :update, :destroy]

  # GET /absolute_data
  def index
    @absolute_data = AbsoluteDatum.includes(:absolute_datum_level).all
  end

  # GET /absolute_data/new
  def new
    @absolute_datum = AbsoluteDatum.new
  end

  # GET /absolute_data/1/edit
  def edit
  end

  # POST /absolute_data
  def create
    @absolute_datum = AbsoluteDatum.new(absolute_datum_params)

    if @absolute_datum.save
      redirect_to absolute_data_path, notice: 'Dados armazenados com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /absolute_data/1
  def update
    if @absolute_datum.update(absolute_datum_params)
      redirect_to absolute_data_path, notice: 'Dados atualizados com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /absolute_data/1
  def destroy
    @absolute_datum.destroy
    redirect_to absolute_data_url, notice: 'Absolute datum was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_absolute_datum
      @absolute_datum = AbsoluteDatum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def absolute_datum_params
      params.require(:absolute_datum).permit(:absolute_datum_level_id, :name)
    end
end
