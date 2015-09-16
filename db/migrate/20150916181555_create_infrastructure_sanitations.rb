class CreateInfrastructureSanitations < ActiveRecord::Migration
  def change
    create_table :infrastructure_sanitations do |t|
      t.references :pdsi, index: true, foreign_key: true
      t.references :village, index: true, foreign_key: true
      t.boolean :abastecimento_agua
      t.boolean :abastecimento_agua_alternativo
      t.boolean :saa_completo
      t.string :nome_saa
      t.string :tipo_captacao_agua
      t.string :nome_concessionaria
      t.string :tipo_tratamento_agua
      t.boolean :abastecimento_mqa
      t.boolean :saa_manutencao
      t.integer :qtd_msd_individual
      t.integer :qtd_msd_coletiva
      t.boolean :esgotamento_sanitario

      t.timestamps null: false
    end
  end
end
