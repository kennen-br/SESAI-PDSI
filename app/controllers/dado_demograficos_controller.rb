class DadoDemograficosController < ApplicationController
  before_action :set_dado_demografico#, only: [:show, :edit, :update, :destroy]

  # GET /dado_demograficos
  def index
    @dado_demograficos = DadoDemografico.all
  end

  # GET /dado_demograficos/1/edit
  def edit
  end

  # PATCH/PUT /dado_demograficos/1
  def update
    if @dado_demografico.update(dado_demografico_params)
      redirect_to pdsis_path, notice: 'Dados atualizados com sucesso.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dado_demografico
      @dado_demografico = current_user.pdsi.dado_demografico
    end

    # Only allow a trusted parameter "white list" through.
    def dado_demografico_params
      params.require(:dado_demografico).permit(:pdsi_id, :extensao_territorial, :municipio_sede, :endereco, :email, :numero_municipios, :populacao_indigena, :etnias, :numero_polos_base, :numero_ubsi, :numero_regioes_de_saude, :numero_casais, :numero_aldeias, :numero_familias, :meios_de_transporte)
    end
end
