class AddAnaliseSitacional4ToPdsi < ActiveRecord::Migration
  def change
    add_column :pdsis, :analise_situacional_4, :text
  end
end
