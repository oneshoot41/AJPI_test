class Provider < Granite::Base
  adapter mysql
  has_many provider_invoices : ProviderInvoice

  table_name providers

  primary id : Int64
  field name : String
  timestamps
end
