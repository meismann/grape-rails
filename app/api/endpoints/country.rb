module Endpoints
  class Country < Grape::API
    namespace :countries do
      desc 'All Countries',
        params: Entities::Country.documentation
      get '/' do
        present ::Country.all, with: Entities::Country
      end
    end
  end
end
