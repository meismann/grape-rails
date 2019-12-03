module Entities
  module Concerns
    module ExposesTimestamps
      extend ActiveSupport::Concern
      included do
        expose :created_at
        expose :updated_at
      end
    end
  end
end
