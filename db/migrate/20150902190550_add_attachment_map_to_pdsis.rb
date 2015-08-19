class AddAttachmentMapToPdsis < ActiveRecord::Migration
  def self.up
    change_table :pdsis do |t|
      t.attachment :map
    end
  end

  def self.down
    remove_attachment :pdsis, :map
  end
end
