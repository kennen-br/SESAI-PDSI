class TextTemplatesController < ApplicationController
  before_action :set_text_template
  before_action :check_sesai_central_actions#,  only: [:index, :edit, :update]

  # GET /text_templates
  def index
  end

  def edit
    @section_url  = params[:section].gsub(/_/, '-')
    @section      = params[:section].gsub(/-/, '_')
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
    params.require(:text_template).permit(:introducao_1, :processo_construcao_pdsi_2)
  end
end
