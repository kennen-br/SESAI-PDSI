class RenameTypeToCapaiTypeOnCapais < ActiveRecord::Migration
  def change
    rename_column :capais, :type, :capai_type
  end
end
