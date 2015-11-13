class ChangeReferencesOfServiceNetwork < ActiveRecord::Migration
  def change
    remove_reference :health_establishments,  :service_network, index: true, foreign_key: true
    remove_reference :health_specializeds,    :service_network, index: true, foreign_key: true

    add_reference :health_establishments,  :service_network_city, index: true, foreign_key: true
    add_reference :health_specializeds,    :service_network_city, index: true, foreign_key: true
  end
end
