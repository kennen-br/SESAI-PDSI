class AddPrincipaisDesafios42ToPdsi < ActiveRecord::Migration
  def change
    add_column :pdsis, :principais_desafios_4_2, :text
  end
end
