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
    method = "value_#{year.to_s}"
    result.result_text.gsub(/\[VALUE\]/, "<span class='value'>#{send(method)}</span>")
  end

  def editable_value(year)
    result.result_text.gsub(/\[VALUE\]/, '')
  end

  def css(year)
    value = send("value_#{year}")
    return '' if value.blank?
    value >= result.send("value_#{year}") ? 'green' : 'red'
  end
end
