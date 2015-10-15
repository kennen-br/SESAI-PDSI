class AddValue2016ToPdsiResult < ActiveRecord::Migration
  def change
    add_column :pdsi_results, :value_2016, :integer
    add_column :pdsi_results, :value_2017, :integer
    add_column :pdsi_results, :value_2018, :integer
    add_column :pdsi_results, :value_2019, :integer

    remove_column :pdsi_results, :value, :integer
  end
end
