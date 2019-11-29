module Entities
  class Address < Grape::Entity
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
