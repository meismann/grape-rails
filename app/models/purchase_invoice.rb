class PurchaseInvoice < Artefact
  self.table_name = 'artefacts'

  has_many :line_items, class_name: 'PurchaseInvoiceLineItem', foreign_key: :artefact_id
end
