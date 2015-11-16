class AddIsSesaiCentralToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :is_sesai_central, :boolean, default: false
    change_column_null :people, :dsei_id, true

    dsei  = Dsei.find_by_name('SESAI CENTRAL')
    dsei.people.update_all(is_sesai_central: true, dsei_id: nil)
    dsei.destroy
  end

  def self.down
    dsei  = Dsei.where(name: 'SESAI CENTRAL').first
    if dsei.nil?
      dsei  = Dsei.create(name: 'SESAI CENTRAL', sesai_id: 12345)
      id    = dsei.id
      dsei.update(sesai_id: id)
    end
    Person.where(is_sesai_central: true).update_all(dsei_id: dsei.id)

    change_column_null :people, :dsei_id, false
    remove_column :people, :is_sesai_central
  end
end
