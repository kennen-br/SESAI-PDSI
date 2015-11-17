class AddIsSesaiCentralToPeople < ActiveRecord::Migration
  def change
    add_column :people, :is_sesai_central, :boolean, default: false
    change_column_null :people, :dsei_id, true
  end
end
