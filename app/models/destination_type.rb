class DestinationType < ActiveRecord::Base
  auditable

  has_many  :destinations

  def snake_name
    I18n.transliterate(name.split(/\d\.\s/).last).gsub(/\s/, '_').downcase
  end
end
