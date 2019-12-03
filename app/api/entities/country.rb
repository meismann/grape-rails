module Entities
  class Country < Base
    self.model = ::Country

    expose :code
    expose :name
  end
end
