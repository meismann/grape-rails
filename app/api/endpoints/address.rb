module Endpoints
  class Address < Grape::API
    namespace :addresses do
      desc 'All Addresses',
        params: Entities::Address.documentation
      get '/' do
        present ::Address.all, with: Entities::Address
      end
    end
  end
end
