class DemographicDatasController < ApplicationController
  before_action :set_demographic_data#, only: [:show, :edit, :update, :destroy]

  # GET /demographic_datas
  def index
    @demographic_datas = DemographicData.all
  end

  # GET /demographic_datas/1/edit
  def edit
  end

  # PATCH/PUT /demographic_datas/1
  def update
    if @demographic_data.update(demographic_data_params)
      redirect_to edit_demographic_data_path(@demographic_data), notice: 'Dados atualizados com sucesso.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demographic_data
      @demographic_data = current_user.pdsi.demographic_data
    end

    # Only allow a trusted parameter "white list" through.
    def demographic_data_params
      params.require(:demographic_data).permit(:pdsi_id, :extensao_territorial, :municipio_sede, :endereco, :email, :numero_municipios, :populacao_indigena, :numero_polos_base, :numero_ubsi, :numero_regioes_de_saude, :numero_casais, :numero_aldeias, :numero_familias, etnias_attributes: [:id, :name, :_destroy], transportations_attributes: [:id, :name, :_destroy])
    end
end
