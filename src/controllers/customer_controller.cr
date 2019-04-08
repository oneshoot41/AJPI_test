class CustomerController < ApplicationController
    getter customer = Customer.new
    
    before_action do
      only [:show, :edit, :update, :destroy] { set_customer }
    end

    def index
      customers = Customer.all
      render "index.ecr"
    end
  
    def show
      render "show.ecr"
    end
  
    def new
      render "new.ecr"
    end
  
    def edit
      render "edit.ecr"
    end
  
    def create
        customer = Customer.new customer_params.validate!
      if customer.save
        redirect_to action: :index, flash: {"success" => "Client créé"}
      else
        flash[:danger] = "Could not create Customer!"
        render "new.ecr"
      end
    end
  
    def update
        customer.set_attributes customer_params.validate!
      if customer.save
        redirect_to action: :index, flash: {"success" => "Client édité"}
      else
        flash[:danger] = "Could not update Customer!"
        render "edit.ecr"
      end
    end
  
    def destroy
      customer.destroy
      redirect_to action: :index, flash: {"success" => "Client supprimé"}
    end

    private def customer_params
    params.validation do
      required :name
        end
    end

    private def set_customer
        @customer = Customer.find! params[:id]
    end
end
