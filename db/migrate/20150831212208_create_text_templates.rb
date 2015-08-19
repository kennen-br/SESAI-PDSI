class CreateTextTemplates < ActiveRecord::Migration
  def change
    create_table :text_templates do |t|
      t.text :introducao_1

      t.timestamps null: false
    end
  end
end
