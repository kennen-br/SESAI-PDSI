class CreateEmsis < ActiveRecord::Migration
  def change
    create_table :emsis do |t|
      t.references :pdsi,       index: true, foreign_key: true
      t.references :base_polo,  index: true, foreign_key: true
      t.string  :name,    null: false
      t.integer :numero_medicos
      t.integer :numero_enfermeiros
      t.integer :numero_odontologistas
      t.integer :numero_tecnicos_enfermagem
      t.integer :asb
      t.integer :ais
      t.integer :aisan
      t.integer :aldeias_atendidas
      t.integer :permanencia_medicos
      t.integer :permanencia_enfermeiros
      t.integer :permanencia_odontologistas
      t.integer :permanencia_tecnicos_enfermagem

      t.timestamps null: false
    end
  end
end
