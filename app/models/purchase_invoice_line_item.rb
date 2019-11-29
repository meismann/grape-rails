class PurchaseInvoiceLineItem < ApplicationRecord
  self.table_name = 'artefact_line_items'

  belongs_to :artefact
end
