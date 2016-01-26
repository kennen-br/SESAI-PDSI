class AddSumFieldsToPdsiHumanResources < ActiveRecord::Migration
  def change
    add_column :pdsi_human_resources, :actual_sum, :integer
    add_column :pdsi_human_resources, :indigenous_sum, :integer
    add_column :pdsi_human_resources, :workforce_needed, :integer
    rename_column :pdsi_human_resources, :polo_base_tipo_2, :polo_base_tipo_2_atual
  end
end
