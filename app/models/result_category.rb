class ResultCategory < ActiveRecord::Base
  auditable

  has_many  :results
end
