require "./spec_helper"
require "../../src/models/customer.cr"

describe Customer do
  Spec.before_each do
    Customer.clear
  end
end
