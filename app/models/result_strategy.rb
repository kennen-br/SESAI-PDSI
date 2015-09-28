class ResultStrategy < ActiveRecord::Base
  auditable

  belongs_to  :parent,  class_name: 'ResultStrategy'
  belongs_to  :result_axis

  has_many  :children,  class_name: 'ResultStrategy', foreign_key: :parent_id
  has_many  :results
end
