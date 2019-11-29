module Entities
  class Country < Grape::Entity
    expose :code
    expose :name
  end
end
