module Entities
  class Contact < Grape::Entity
    expose :name
    expose :address,
      using: Entities::Address

    def name
      "#{object.firstname} #{object.lastname}"
    end
  end
end
