require "./spec_helper"
require "../../src/models/customer_invoice.cr"

describe CustomerInvoice do
  Spec.before_each do
    CustomerInvoice.clear
  end
end
