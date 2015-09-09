require 'csv'
require "#{Rails.root}/lib/debug.rb"

namespace :data do
  task import: :environment do
    count = 0
    first = true
    CSV.foreach("#{Rails.root}/batch/etnias.csv") do |row|
      if first
        first = false
        next
      end

      item    = row_to_hash row
      aldeia  = aldeia_from_sesai_id item
      etnia   = etnia_from_sesai_id item

      etnia_to_vila_unless_exists etnia, aldeia

      break if count > 9
      count += 1
    end
  end
end

def row_to_hash(row)
  item  = {}

  item[:dsei_name]          = row[0]
  item[:dsei_sesai_id]      = row[1].to_i
  item[:polo_base_name]     = row[2]
  item[:polo_base_sesai_id] = row[3].to_i
  item[:municipio_id]       = row[4].to_i
  item[:municipio_name]     = row[5]
  item[:aldeia_sesai_id]    = row[6].to_i
  item[:aldeia_name]        = row[7]
  item[:etnia_sesai_id]     = row[8].to_i
  item[:etnia_name]         = row[9]

  item
end

def dsei_from_sesai_id(hash)
  item  = Dsei.where(sesai_id: hash[:dsei_sesai_id]).first_or_initialize
  return item unless item.id.nil?

  item.name = hash[:dsei_name]

  unless item.valid?
    fail "DSEI || #{hash.to_s} => #{item.errors.messages.to_s}"
  end

  item.save

  item
end

def polo_base_from_sesai_id(hash)
  item  = BasePolo.where(sesai_id: hash[:polo_base_sesai_id]).first_or_initialize
  return item unless item.id.nil?


  item.name = hash[:polo_base_name]
  item.dsei = dsei_from_sesai_id hash

  unless item.valid?
    fail "Polo Base || #{hash.to_s} => #{item.errors.messages.to_s}"
  end

  item.save

  item
end

def aldeia_from_sesai_id(hash)
  item  = Village.where(sesai_id: hash[:aldeia_sesai_id]).first_or_initialize
  return item unless item.id.nil?

  item.name           = hash[:aldeia_name]
  item.base_polo      = polo_base_from_sesai_id hash
  item.city_name      = hash[:municipio_name]
  item.city_sesai_id  = hash[:municipio_id]

  unless item.valid?
    fail "Aldeia || #{hash.to_json} => #{item.errors.messages.to_s}"
  end

  item.save

  item
end

def etnia_from_sesai_id(hash)
  item  = Ethnicity.where(sesai_id: hash[:etnia_sesai_id]).first_or_initialize
  return item unless item.id.nil?

  item.name = hash[:etnia_name]

  unless item.valid?
    fail "Etnia || #{hash.to_s} => #{item.errors.messages.to_s}"
  end

  item.save

  item
end

def etnia_to_vila_unless_exists(etnia, aldeia)

  aldeia.ethnicities << etnia if aldeia.ethnicities.where(id: etnia.id).empty?

  unless aldeia.valid?
    fail "EthnicityVillage || #{hash.to_s} => #{item.errors.messages.to_s}"
  end

  aldeia.save

end
