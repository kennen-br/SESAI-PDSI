class AddMetaPpaToResults < ActiveRecord::Migration
  def change
    add_column :results, :meta_ppa, :boolean
    add_column :results, :not_in, :boolean
    add_column :results, :result_item, :integer
  end
end
