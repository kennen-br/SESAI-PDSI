class CasaisController < ApplicationController
  before_action :set_casai, only: [:edit, :update, :destroy]

  # GET /casais
  def index
    @dsei   = current_dsei
    @casais = Casai.where(dsei: @dsei).order(:name)
  end

  # GET /casais/new
  def new
    @casai = Casai.new
  end

  # GET /casais/1/edit
  def edit
  end

  # POST /casais
  def create
    @casai      = Casai.new(casai_params)
    @casai.dsei = current_dsei

    if @casai.save
      redirect_to casais_path, notice: 'Dados armazenados com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /casais/1
  def update
    if @casai.update(casai_params)
      redirect_to casais_path, notice: 'Dados atualizados com sucesso.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_casai
      @casai = Casai.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def casai_params
      params.require(:casai).permit(:dsei_id, :name)
    end
end
