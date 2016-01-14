class AddTotalTimeToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :total_time, :string
  end
end
