module Endpoints
  class Contact < Grape::API
    namespace :contacts do
      desc 'All Contacts',
        params: Entities::Contact.documentation
      get '/' do
        present ::Contact.all, with: Entities::Contact
      end
    end
  end
end
