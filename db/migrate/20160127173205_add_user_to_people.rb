class AddUserToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :user_id, :int
  	add_foreign_key :people, :users
  end
end
