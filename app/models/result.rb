class Result < ActiveRecord::Base
  auditable

  belongs_to  :result_level
  belongs_to  :result_strategy

  has_many  :specific_results
  has_many  :pdsi_results

  validates :result_level,    presence: true
  validates :result_strategy, presence: true
  validates :name,            length: { maximum: 255 }, presence: true, uniqueness: true

  def text
    result_text.blank? ? name : result_text
  end

  def text_no_index
    name.gsub /^\d\.?\d?\s/, ''
  end
end
