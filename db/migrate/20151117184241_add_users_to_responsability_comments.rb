class AddUsersToResponsabilityComments < ActiveRecord::Migration
  def change
    add_column :responsability_comments, :users, :text, default: '[]'
  end
end
