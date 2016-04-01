class Capai < ActiveRecord::Base
  auditable

  belongs_to :pdsi

  has_many :capai_villages, dependent: :destroy
  accepts_nested_attributes_for :capai_villages, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :city_name,
                        :uf,
                        :capai_type,
                        :host_capacity
                        :name
end
