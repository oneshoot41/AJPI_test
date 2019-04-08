class Month < Granite::Base
  adapter mysql
  table_name months

  has_many provider_invoices : ProviderInvoice
  has_many customer_invoices : CustomerInvoice
  belongs_to :year

  primary id : Int64
  field name : String
  timestamps
end
