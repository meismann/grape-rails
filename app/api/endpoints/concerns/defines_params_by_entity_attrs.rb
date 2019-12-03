module Endpoints
  module Concerns
    module DefinesParamsByEntityAttrs
      extend ActiveSupport::Concern

      included do |base|
        #rescue_from :all

        entity = self.name.sub('Endpoints::', 'Entities::').constantize

        namespace entity.name.demodulize.tableize do
          desc "Post a #{entity.name.demodulize.titleize}"
          params do
            requires :all, using: entity.postable_params_definitions
          end
          post do
            instance = entity.assign_to_instance(params)
            instance.save!
            present instance
          end
        end
      end
    end
  end
end
