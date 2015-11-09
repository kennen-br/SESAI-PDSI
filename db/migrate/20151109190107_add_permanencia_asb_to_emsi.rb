class AddPermanenciaAsbToEmsi < ActiveRecord::Migration
  def change
    add_column :emsis, :permanencia_asb, :integer
  end
end
