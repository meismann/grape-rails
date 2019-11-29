class Artefact < ApplicationRecord
  self.abstract_class = true

  belongs_to :contact
  belongs_to :main_address, class_name: 'Address'
  belongs_to :delivery_address, class_name: 'Address'
end
