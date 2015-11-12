class ResultLevel < ActiveRecord::Base
  include Stringable
  auditable

  has_many  :results
end
