class ResultCategory < ActiveRecord::Base
  auditable

  belongs_to  :parent,  class_name: 'ResultCategory'

  has_many  :children,  class_name: 'ResultCategory', foreign_key: :parent_id
  has_many  :results

  scope :base_categories,  -> { where(parent_id: nil).order(:id) }
end
