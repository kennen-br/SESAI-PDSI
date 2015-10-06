class ResultStrategy < ActiveRecord::Base
  extend ActiveSupport::Concern

  belongs_to  :parent,  class_name: 'ResultStrategy'
  belongs_to  :result_axis

  has_many  :children,  class_name: 'ResultStrategy', foreign_key: :parent_id
  has_many  :results
end
