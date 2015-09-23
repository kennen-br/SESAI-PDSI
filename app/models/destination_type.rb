class DestinationType < ActiveRecord::Base
  auditable

  has_many  :destinations
end
