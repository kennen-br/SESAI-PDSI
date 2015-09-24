class ResultLevel < ActiveRecord::Base
  auditable

  has_many  :results
end
