class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.references  :pdsi, index: true, foreign_key: true
      t.integer     :origin_village_id,       null: false
      t.integer     :destination_village_id,  null: false
      t.references  :destination_type, index: true, foreign_key: true
      t.string      :boat_time
      t.string      :road_time
      t.string      :fly_time

      t.timestamps null: false
    end

    add_foreign_key :destinations,  :villages,  column: :origin_village_id,       primary_key:  :id
    add_foreign_key :destinations,  :villages,  column: :destination_village_id,  primary_key:  :id
  end
end
