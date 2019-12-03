module Entities
  class PurchaseInvoice < Base
    include Concerns::ExposesTimestamps

    self.model = ::PurchaseInvoice

    expose :sageone_guid,
      as: :id,
      documentation: { # TODO: Infer from model; shrink to description
        type: String,
        desc: 'Die Master-ID'
      }

    expose :date
    expose :total
    expose :issued,
      as: :sent,
      documentation: {
        type: Grape::API::Boolean,
        desc: 'Has this invoice been sent?'
      }
    expose :contact,
      using: Entities::Contact
    expose :main_address,
      using: Entities::Address
    expose :delivery_address,
      using: Entities::Address
  end
end
