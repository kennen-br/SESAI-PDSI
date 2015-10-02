class AddDseiToPdsi < ActiveRecord::Migration
  def change
    add_reference :pdsis, :dsei, index: true, foreign_key: true
  end
end
