class CreatePdsiNeedInvestiments < ActiveRecord::Migration
  def change
    create_table :pdsi_need_investiments do |t|
      t.references :projection_budget_item, index: true, foreign_key: true
      t.references :pdsi, index: true, foreign_key: true
      t.integer :qtde_existente_2015
      t.integer :qtde_necessaria
      t.decimal :valor_unitario_medio
      t.decimal :previsao_orcamentaria

      t.timestamps null: false
    end
  end
end
