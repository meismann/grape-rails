module Entities
  class Address < Base
    self.model = ::Address

    expose :sageone_guid,
      as: :id,
      documentation: {
        type: String,
        desc: 'Die Master-ID'
      }

    expose :street
    expose :postcode
    expose :country,
      using: Entities::Country
  end
end
