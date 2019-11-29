module Endpoints
  class PurchaseInvoice < Grape::API
    namespace :purchase_invoices do
      desc 'All Purchase Invoices',
        params: Entities::PurchaseInvoice.documentation
      get do
        present ::PurchaseInvoice.all, with: Entities::PurchaseInvoice
      end
    end
  end
end
