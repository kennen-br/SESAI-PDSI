class AddDseiRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :dsei, index: true, foreign_key: true
  end
end
