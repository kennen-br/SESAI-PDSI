class CreatePhysiographicDatas < ActiveRecord::Migration
  def change
    create_table :physiographic_datas do |t|
      t.references :pdsi, index: true, foreign_key: true
      t.references :village, index: true, foreign_key: true
      t.string :pt_fluency
      t.integer :m_1
      t.integer :m_1_4
      t.integer :m_5_9
      t.integer :m_10_49
      t.integer :m_50_59
      t.integer :m_60
      t.integer :w_1
      t.integer :w_1_4
      t.integer :w_5_9
      t.integer :w_10_49
      t.integer :w_50_59
      t.integer :w_60

      t.timestamps null: false
    end
  end
end
