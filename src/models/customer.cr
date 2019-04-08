class Customer < Granite::Base
  adapter mysql
  has_many customer_invoices : CustomerInvoice

  table_name customers

  primary id : Int64
  field name : String
  timestamps
end
