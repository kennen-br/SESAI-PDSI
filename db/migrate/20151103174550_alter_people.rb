class AlterPeople < ActiveRecord::Migration
  def change
    add_column :people, :location, :string
    add_column :people, :bond, :string
  end
end
