class ResultAxis < ActiveRecord::Base
  self.table_name = 'result_axes'
  auditable

  has_many  :result_strategies

  before_create :set_section_name

  def set_section_name
    self.section_name  = I18n.transliterate(name.split(/\d\.\s/).last).gsub(/\s/, '_').downcase
  end

  def section_link
    section_name.gsub /_/, '-'
  end
end
