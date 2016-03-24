class AddFederalToPdsiHumanResource < ActiveRecord::Migration
  def change
    add_column :pdsi_human_resources, :federal, :string
  end
end
