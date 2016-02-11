class EthnicitiesVillage < ActiveRecord::Base
  belongs_to :ethnicity
  belongs_to :village
end
