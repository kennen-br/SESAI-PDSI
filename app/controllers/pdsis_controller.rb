class PdsisController < ApplicationController
  before_action :set_pdsi#, only: [:index, :show, :edit, :update]
  #before_action :set_physiographic_data, only: [:edit]

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
    @dsei             = current_user.dsei
  end

  # Only allow a trusted parameter "white list" through.
  def pdsi_params
    params.require(:pdsi).permit(
      :user_id, :processo_construcao_pdsi_2, :caracterizacao_do_dsei_3, :map,

      pdsi_base_polo_data_attributes: [:id, :base_polo_id, :city_name],
      physiographic_datas_attributes: [
        :id, :vilage_id, :pt_fluency, :m_1, :m_1_4, :m_5_9, :m_10_49, :m_50_59, :m_60, :w_1, :w_1_4, :w_5_9, :w_10_49, :w_50_59, :w_60,
        physiographic_data_languages_attributes: [:id, :physiographic_data_id, :language]
      ]
    )
  end
end
