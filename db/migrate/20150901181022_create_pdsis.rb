class CreatePdsis < ActiveRecord::Migration
  def change
    create_table :pdsis do |t|
      t.references  :user, index: true, foreign_key: true
      t.text        :processo_construcao_pdsi_2

      t.timestamps null: false
    end
  end
end
