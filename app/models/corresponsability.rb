class Corresponsability < ActiveRecord::Base
  belongs_to :responsability
  belongs_to :person
end
