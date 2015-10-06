class Result < ActiveRecord::Base
  include Parentable
  auditable

  belongs_to  :result_level
  belongs_to  :result_strategy
  belongs_to  :parent,  class_name: 'Result'

  has_many  :children,  class_name: 'Result', foreign_key: :parent_id
  has_many  :specific_results
  has_many  :pdsi_results

  validates :result_level,    presence: true
  validates :result_strategy, presence: true
  validates :name,            length: { maximum: 255 }, presence: true, uniqueness: true


  def has_children?
    !children.empty?
  end

  def text
    result_text.blank? ? name : result_text
  end

  def text_no_index
    name.gsub /^\d\.?\d?\s/, ''
  end

  def css
    puts "="*300, id, "="*300
    return '' if pdsi_results.first.value.nil?
    pdsi_results.first.value >= reference_value ? 'green' : 'red'
  end
end
