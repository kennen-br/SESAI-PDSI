class Person < ActiveRecord::Base
  auditable

  belongs_to :dsei
  has_many  :responsabilities
end
