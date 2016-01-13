class AddCityToCasai < ActiveRecord::Migration
  def change
    add_column :casais, :city_name, :string
  end
end
