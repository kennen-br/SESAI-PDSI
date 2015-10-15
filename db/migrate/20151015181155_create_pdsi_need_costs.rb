class CreatePdsiNeedCosts < ActiveRecord::Migration
  def change
    create_table :pdsi_need_costs do |t|
      t.references :cost, index: true, foreign_key: true
      t.references :pdsi, index: true, foreign_key: true
      t.decimal :previsao_orcamentaria_2015
      t.decimal :previsao_orcamentaria_2016
      t.decimal :orcamento_necessario
      t.decimal :orcamento_necessario_pleno

      t.timestamps null: false
    end
  end
end
