class CustomerInvoice < Granite::Base
  adapter mysql
  belongs_to :customer
  belongs_to :month

  table_name customer_invoices
  
  primary id : Int64
  field name : String
  field amount : Float32
  field paid : Bool
  field estimated : Bool
  field type : String
  timestamps
end
