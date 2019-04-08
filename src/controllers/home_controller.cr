class HomeController < ApplicationController
  def index
    render("index.ecr")
  end

  def invoices
    render("invoices.ecr")
  end
end
