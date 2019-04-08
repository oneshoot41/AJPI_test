class ProviderInvoice < Granite::Base
  adapter mysql
  belongs_to :provider
  belongs_to :month
  
  table_name provider_invoices

  primary id : Int64
  field name : String
  field amount : Float32
  field paid : Bool
  field estimated : Bool
  field type : String
  timestamps
end
