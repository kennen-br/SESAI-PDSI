class AddTextsToSpecificResult < ActiveRecord::Migration
  def change
    add_column :specific_results, :text_2016, :text
    add_column :specific_results, :text_2017, :text
    add_column :specific_results, :text_2018, :text
    add_column :specific_results, :text_2019, :text
  end
end
