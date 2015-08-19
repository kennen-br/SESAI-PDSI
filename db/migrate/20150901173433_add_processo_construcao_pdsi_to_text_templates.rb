class AddProcessoConstrucaoPdsiToTextTemplates < ActiveRecord::Migration
  def change
    add_column  :text_templates,  :processo_construcao_pdsi_2,  :text
  end
end
