class AddInitialDateToResponsability < ActiveRecord::Migration
  def change
    add_column :responsabilities, :initial_date, :date
  end
end
