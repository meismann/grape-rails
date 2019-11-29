class Api < Grape::API
  format :json
  prefix :api

  mount Endpoints::PurchaseInvoice
  mount Endpoints::Contact
  mount Endpoints::Country
  mount Endpoints::Address
end
