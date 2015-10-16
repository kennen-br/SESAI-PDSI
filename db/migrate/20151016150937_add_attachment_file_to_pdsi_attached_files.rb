class AddAttachmentFileToPdsiAttachedFiles < ActiveRecord::Migration
  def self.up
    change_table :pdsi_attached_files do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :pdsi_attached_files, :file
  end
end
