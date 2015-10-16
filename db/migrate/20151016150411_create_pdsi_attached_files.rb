class CreatePdsiAttachedFiles < ActiveRecord::Migration
  def change
    create_table :pdsi_attached_files do |t|
      t.references :pdsi, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
