class CreatePdsiCosts < ActiveRecord::Migration
  def change
    create_table :pdsi_costs do |t|
      t.references :pdsi, index: true, foreign_key: true
      t.references :cost, index: true, foreign_key: true
      t.decimal :previsao_orcamentaria_2015
      t.decimal :orcamento_necessario
      t.decimal :dotacao_orcamentaria_inicial

      t.timestamps null: false
    end
  end
end
