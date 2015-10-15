module Parentable
  extend ActiveSupport::Concern

  included do
    belongs_to  :parent,    class_name: self.model_name.name
    has_many    :children,  class_name: self.model_name.name, foreign_key: :parent_id

    scope :base_results,  -> { where(parent_id: nil).order(:id) }
  end

  def has_children?
    !children.empty?
  end
end
