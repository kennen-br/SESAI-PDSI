class CreateHealthSpecializeds < ActiveRecord::Migration
  def change
    create_table :health_specializeds do |t|
      t.references :service_network, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
