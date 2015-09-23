require 'csv'
require "#{Rails.root}/lib/debug.rb"

namespace :data do
  task absolute_data_base_polo_import: :environment do
    read_file "#{Rails.root}/batch/absolute_data_base_polos.csv", 1
  end

  task absolute_data_casai_import: :environment do
    read_file "#{Rails.root}/batch/absolute_data_casais.csv", 2
  end

  task absolute_data_dsei_import: :environment do
    read_file "#{Rails.root}/batch/absolute_data_dseis.csv", 3
  end
end

def read_file(file, level)
  CSV.foreach(file) { |row| AbsoluteDatum.where(name: row, absolute_datum_level_id: level).first_or_create }
end
