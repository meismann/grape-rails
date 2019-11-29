Country.delete_all
Address.delete_all
Contact.delete_all
PurchaseInvoice.delete_all
PurchaseInvoiceLineItem.delete_all

country_de = Country.create!(name: 'Deutschland', code: 'DE')
country_fr = Country.create!(name: 'Frankreich', code: 'FR')
country_uk = Country.create!(name: 'Ukraine', code: 'UK')
country_cn = Country.create!(name: 'China', code: 'CN')

address_de_1 = Address.create!(street: 'Wigandstr. 14', postcode: '04229', country: country_de)
address_de_2 = Address.create!(street: 'Uferstr. 18', postcode: '01457', country: country_de)

contact_1 = Contact.create!(firstname: 'Martin', lastname: 'Eismann', address: address_de_2)

purchase_invoice = PurchaseInvoice.create!(
  date: Date.new(2019, 11, 11),
  reference: 'PI-1',
  total: 10.0,
  issued: false,
  contact: contact_1,
  main_address: address_de_1,
  delivery_address: address_de_2
)

purchase_invoice_line_items_1 = PurchaseInvoiceLineItem.create!(
  name: 'Hose',
  net_amount: 2.0,
  quantity: 2,
  artefact: purchase_invoice
)
purchase_invoice_line_items_2 = PurchaseInvoiceLineItem.create!(
  name: 'Gestrümpf',
  net_amount: 1.0,
  quantity: 6,
  artefact: purchase_invoice
)
