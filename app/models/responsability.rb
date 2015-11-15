class Responsability < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :result
  belongs_to :person
  belongs_to :responsability_level
  belongs_to :parent, class_name: 'Responsability'

  has_many :people, through: :corresponsabilities
  has_many :corresponsabilities, :dependent => :destroy
  accepts_nested_attributes_for :corresponsabilities, reject_if: :all_blank, allow_destroy: true

  has_many  :children,  class_name: 'Responsability', foreign_key: :parent_id, :dependent => :destroy
  accepts_nested_attributes_for :children, reject_if: :all_blank, allow_destroy: true

  has_many  :responsability_comments, :dependent => :destroy
  accepts_nested_attributes_for :responsability_comments, reject_if: :all_blank, allow_destroy: true

  amoeba do
    include_association :children
    include_association :corresponsabilities
    include_association :responsability_comments
  end

  def people_names
    people.map(&:name).join(', ')
  end
end
