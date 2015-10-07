module Parentable
  extend ActiveSupport::Concern

  included do
    belongs_to  :parent,  class_name: self.class.name

    scope :base_results,  -> { where(parent_id: nil).order(:id) }
  end
end
