class CreateResponsabilityReferences < ActiveRecord::Migration
  def change
    create_table :responsability_references do |t|
    	t.integer  :responsability_id
      t.integer  :pdsi_id
      t.integer  :result_id

      t.timestamps null: false
    end
  end
end
