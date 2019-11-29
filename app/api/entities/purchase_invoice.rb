module Entities
  class PurchaseInvoice < Grape::Entity
    expose :sageone_guid,
      as: :id,
      documentation: {
        type: String,
        desc: 'Die Master-ID'
      }

    expose :date
    expose :total
    expose :issued
    expose :contact,
      using: Entities::Contact
    expose :main_address,
      using: Entities::Address
    expose :delivery_address,
      using: Entities::Address
    expose :created_at, :updated_at
  end
end
