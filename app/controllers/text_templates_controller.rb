class TextTemplatesController < ApplicationController
  before_action :set_text_template
  before_action :check_sesai_central_actions#,  only: [:index, :edit, :update]
  before_action :set_section, except: [:index, :introducao_sesai, :analise_situacional_sesai, :processo_de_construcao_sesai]

  # GET /text_templates
  def index
  end

  def introducao_sesai
  end

  def analise_situacional_sesai
  end

  def processo_de_construcao_sesai
  end

  def edit
  end

  def update
    if @text_template.update(text_template_params)
      redirect_to text_templates_path, notice: 'Dados atualizados com sucesso.'
    else
      render :edit
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_text_template
    @text_template  = TextTemplate.first_or_create
  end

  # Only allow a trusted parameter "white list" through.
  def text_template_params
    params.require(:text_template).permit(:introducao_1, :processo_construcao_pdsi_2, :analise_situacional_4)
  end

  def set_section
    @section_url  = params[:section].gsub(/_/, '-')
    @section      = params[:section].gsub(/-/, '_')
  end
end
