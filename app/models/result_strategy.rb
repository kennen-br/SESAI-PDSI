class ResultStrategy < ActiveRecord::Base
  include Stringable
  auditable

  belongs_to  :result_axis

  has_many  :results

  def has_specific_results?
    !results.where(is_specific: true).blank?
  end
end
