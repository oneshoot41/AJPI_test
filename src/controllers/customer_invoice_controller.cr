class CustomerInvoiceController < ApplicationController
    getter customer_invoice = CustomerInvoice.new
    
    before_action do
      only [:show, :edit, :update, :destroy] { set_customer_invoice }
    end

    def index
      customer_invoices = CustomerInvoice.all
      render "index.ecr"
    end
  
    def show
      customers = Customer.all
      render "show.ecr"
    end
  
    def new
      customers = Customer.all
      render "new.ecr"
    end
  
    def edit
      customers = Customer.all
      render "edit.ecr"
    end
  
    def create
        customers = Customer.all
        customer_invoice = CustomerInvoice.new customer_invoice_params.validate!
      if customer_invoice.save
        redirect_to action: :index, flash: {"success" => "Facture client créée"}
      else
        flash[:danger] = "Could not create CustomerInvoice!"
        render "new.ecr"
      end
    end
  
    def update
        customers = Customer.all
        customer_invoice.set_attributes customer_invoice_params.validate!
      if customer_invoice.save
        redirect_to action: :index, flash: {"success" => "Facture client éditée"}
      else
        flash[:danger] = "Could not update CustomerInvoice!"
        render "edit.ecr"
      end
    end
  
    def destroy
      customer_invoice.destroy
      redirect_to action: :index, flash: {"success" => "Facture client supprimée"}
    end

    private def customer_invoice_params
    params.validation do
      required :name
      optional :amount
      optional :paid
      optional :estimated
      optional :type
      optional :customer_id
        end
    end

    private def set_customer_invoice
        @customer_invoice = CustomerInvoice.find! params[:id]
    end
end
