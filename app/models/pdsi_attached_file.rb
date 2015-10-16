class PdsiAttachedFile < ActiveRecord::Base
  belongs_to :pdsi

  has_attached_file :file
  validates_attachment_content_type :file, content_type: ['application/pdf']
end
