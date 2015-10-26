class PdsiResult < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :result

  validates_with PdsiResultValueValidator

  def products
    item = result.responsabilities.where(pdsi: pdsi).first
    return [] if item.nil?

    item.children.includes(:person, :people)
  end

  def compose_value(year)
    if result.is_boolean?
      klass = send("value_#{year.to_s}") == 0 ? 'times' : 'check'
      "<i class='fa fa-#{klass}'></i>"
    else
      result.result_text.gsub(/\[VALUE\]/, send("value_#{year.to_s}").to_s)
    end
  end

  def css(year)
    value = send("value_#{year}")
    return '' if value.blank?
    value >= result.send("value_#{year}") ? 'green' : 'red'
  end
end
