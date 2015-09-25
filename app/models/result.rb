class Result < ActiveRecord::Base
  auditable

  belongs_to  :result_level
  belongs_to  :result_category
  belongs_to  :parent,  class_name: 'Result'

  has_many  :children,  class_name: 'Result', foreign_key: :parent_id
  has_many  :specific_results
  has_many  :pdsi_results

  validates :result_level,    presence: true
  validates :result_category, presence: true
  validates :name,            length: { maximum: 255 }, presence: true, uniqueness: true

  scope :base_results,  -> { where(parent_id: nil).order(:id) }
end
