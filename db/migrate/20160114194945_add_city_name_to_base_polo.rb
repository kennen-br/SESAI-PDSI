class AddCityNameToBasePolo < ActiveRecord::Migration
  def change
    add_column :base_polos, :city_name, :string
  end
end
