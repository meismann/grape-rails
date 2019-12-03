class PurchaseInvoice < Artefact
  self.table_name = 'artefacts'

  has_many :line_items, class_name: 'PurchaseInvoiceLineItem', foreign_key: :artefact_id

  accepts_nested_attributes_for :contact, :main_address, :delivery_address
end
