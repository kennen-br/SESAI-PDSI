module Parentable
  extend ActiveSupport::Concern

  def self.included(klass)
    klass.instance_eval do
      scope :base_results,  -> { where(parent_id: nil).order(:id) }
    end
  end
end
