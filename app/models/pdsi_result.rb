class PdsiResult < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :result

  validates_with PdsiResultValueValidator

  def css(year)
    value = send("value_#{year}")
    return '' if value.blank?
    value >= result.send("value_#{year}") ? 'green' : 'red'
  end
end
