class ResultStrategy < ActiveRecord::Base
  auditable

  belongs_to  :result_axis

  has_many  :results
end
