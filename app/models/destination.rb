class Destination < ActiveRecord::Base
  auditable

  belongs_to  :pdsi
  belongs_to  :origin_village,       class_name: 'Village', foreign_key: :origin_village_id,       required: true
  belongs_to  :destination_village,  class_name: 'Village', foreign_key: :destination_village_id
  belongs_to  :destination_type

  validates :pdsi,                presence: true
  validates :origin_village,      presence: true
  validates :destination_type,    presence: true

  def use_boat?
    !boat_time.blank?
  end

  def use_road?
    !road_time.blank?
  end

  def use_fly?
   !fly_time.blank?
  end

  def class_to_name
    destination_class == 'aldeia' ? 'Aldeia' : 'Município'
  end
end
