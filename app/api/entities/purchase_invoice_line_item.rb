module Entities
  class PurchaseInvoiceLineItem < Base
    include Concerns::ExposesTimestamps

    expose :sageone_guid, as: :id
    expose :name, :quantity, :net_amount
  end
end
