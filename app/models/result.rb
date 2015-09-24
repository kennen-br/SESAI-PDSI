class Result < ActiveRecord::Base
  auditable

  belongs_to  :result_level
  belongs_to  :result_category
  belongs_to  :parent,  class_name: 'Result'

  has_many  :children,  class_name: 'Result', foreign_key: :parent_id
  has_many  :specific_results
end
