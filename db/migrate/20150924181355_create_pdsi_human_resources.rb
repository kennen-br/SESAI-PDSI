class CreatePdsiHumanResources < ActiveRecord::Migration
  def change
    create_table :pdsi_human_resources do |t|
      t.references :pdsi,                     index: true, foreign_key: true
      t.references :human_resource_function,  index: true, foreign_key: true
      t.integer :ubsi_atual
      t.integer :polo_base_tipo_1_atual
      t.integer :polo_base_tipo_2
      t.integer :casai_atual
      t.integer :sead_atual
      t.integer :selog_atual
      t.integer :sesane_atual
      t.integer :seofi_atual
      t.integer :sgep_atual
      t.integer :gabinete_atual
      t.integer :diasi_atual
      t.integer :sesai_dsei
      t.integer :municipio
      t.integer :estado
      t.integer :convenio
      t.integer :mais_medicos
      t.integer :terceirizacao
      t.integer :ubsi_necessaria
      t.integer :polo_base_tipo_1_necessaria
      t.integer :polo_base_tipo_2_necessaria
      t.integer :casai_necessaria
      t.integer :sead_necessaria
      t.integer :selog_necessaria
      t.integer :sesane_necessaria
      t.integer :seofi_necessaria
      t.integer :sgep_necessaria
      t.integer :gabinete_necessaria
      t.integer :diasi_necessaria

      t.timestamps null: false
    end
  end
end
