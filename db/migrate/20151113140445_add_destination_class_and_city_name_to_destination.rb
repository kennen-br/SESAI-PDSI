class AddDestinationClassAndCityNameToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :destination_class, :string
    add_column :destinations, :city_name, :string

    change_column_null :destinations, :destination_village_id, true
  end
end
