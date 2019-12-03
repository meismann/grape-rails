module Endpoints
  class PurchaseInvoice < Grape::API
    include Endpoints::Concerns::DefinesParamsByEntityAttrs

    rescue_from :all

    namespace :purchase_invoices do
      desc 'All Purchase Invoices'
      params do
        optional :active, type: Boolean
        optional :created_or_updated_since, type: DateTime
      end
      get do
        present ::PurchaseInvoice.all, with: Entities::PurchaseInvoice
      end
    end
  end
end
