class Contact < ApplicationRecord
  belongs_to :address
  has_many :purchase_invoices
  accepts_nested_attributes_for :address
end
