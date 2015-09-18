class CreateCapaiVillages < ActiveRecord::Migration
  def change
    create_table :capai_villages do |t|
      t.references :capai, index: true, foreign_key: true
      t.references :village, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
