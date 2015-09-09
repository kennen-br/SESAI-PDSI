class PdsisController < ApplicationController
  before_action :set_pdsi#, only: [:index, :show, :edit, :update]

  # GET /pdsis
  def index
  end

  # GET /pdsis/1
  def show
  end

  def edit
    @section_url  = params[:section].gsub(/_/, '-')
    @section      = params[:section].gsub(/-/, '_')
  end

  def update
    if @pdsi.update(pdsi_params)
      redirect_to pdsis_path, notice: 'Dados atualizados com sucesso.'
    else
      render :edit
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_pdsi
    @pdsi             = current_user.pdsi
    @demographic_data = @pdsi.demographic_data
  end

  # Only allow a trusted parameter "white list" through.
  def pdsi_params
    params.require(:pdsi).permit(:user_id, :processo_construcao_pdsi_2, :caracterizacao_do_dsei_3, :map)
  end
end
