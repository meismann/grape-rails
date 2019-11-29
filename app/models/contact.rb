class Contact < ApplicationRecord
  belongs_to :address
  has_many :purchase_invoices
end
