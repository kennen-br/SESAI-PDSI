class CreateDadoDemograficos < ActiveRecord::Migration
  def change
    create_table :dado_demograficos do |t|
      t.references :pdsi, index: true, foreign_key: true
      t.string :extensao_territorial
      t.string :municipio_sede
      t.string :endereco
      t.string :email
      t.integer :numero_municipios
      t.integer :populacao_indigena
      t.text :etnias
      t.integer :numero_polos_base
      t.integer :numero_ubsi
      t.integer :numero_regioes_de_saude
      t.integer :numero_casais
      t.integer :numero_aldeias
      t.integer :numero_familias
      t.text :meios_de_transporte

      t.timestamps null: false
    end
  end
end
