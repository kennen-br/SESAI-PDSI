class Result < ActiveRecord::Base
  include Stringable
  auditable

  belongs_to  :result_level
  belongs_to  :result_strategy

  has_many  :responsabilities, :dependent => :destroy
  has_many  :specific_results, :dependent => :destroy
  has_many  :pdsi_results, :dependent => :destroy

  has_many  :false_results, :dependent => :destroy
  accepts_nested_attributes_for :false_results, reject_if: :all_blank, allow_destroy: true

  validates :result_level,    presence: true
  validates :result_strategy, presence: true
  validates :name,            length: { maximum: 255 }, presence: true, uniqueness: true

  def text
    result_text.blank? ? name : result_text
  end

  def text_no_index
    name.gsub /^\d\.?\d?\s/, ''
  end

  def dsei_not_apply?(dsei)
    !false_results.where(dsei: dsei).blank?
  end

  def specific
    is_specific ? 'Sim' : 'Não'
  end

  def dsei_specific_result(dsei)
    specific_results.where(dsei: dsei).first
  end

  def responsability_result
    responsabilities.where('parent_id IS NULL').first
  end
end
