require 'csv'
require "#{Rails.root}/lib/debug.rb"

namespace :data do
  task absolute_data_base_polo_import: :environment do
    CSV.foreach("#{Rails.root}/batch/absolute_data_base_polos.csv") { |row| AbsoluteDatum.where(name: row, absolute_datum_level_id: 1).first_or_create }
  end
end
