class Year < Granite::Base
  adapter mysql
  table_name years

  has_many months : Month

  primary id : Int64
  field name : String
  timestamps
end
