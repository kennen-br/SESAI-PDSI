class AddResultadosEsperadosIntroducaoToPdsi < ActiveRecord::Migration
  def change
    add_column :pdsis, :resultados_esperados_introducao_5, :text
  end
end
