class MonthController < ApplicationController
    getter month = Month.new
    
    before_action do
      only [:show, :edit, :update, :destroy] { set_month }
    end

    def index
      months = Month.all
      render "index.ecr"
    end
  
    def show
      provider_invoices = ProviderInvoice.all
      customer_invoices = CustomerInvoice.all
      render "show.ecr"
    end
  
    def new
      years = Year.all
      render "new.ecr"
    end
  
    def edit
      years = Year.all
      render "edit.ecr"
    end
  
    def create
        years = Year.all
        month = Month.new month_params.validate!
      if month.save
        redirect_back(
          flash: {"success" => "Created month successfully."})
      else
        flash[:danger] = "Could not create Month!"
        render "new.ecr"
      end
    end
  
    def update
      years = Year.all
        month.set_attributes month_params.validate!
      if month.save
        redirect_to action: :index, flash: {"success" => "Updated month successfully."}
      else
        flash[:danger] = "Could not update Month!"
        render "edit.ecr"
      end
    end
  
    def destroy
      month.destroy
      redirect_to(
        location: "/years", 
        flash: {"success" => "Suppression effectuée"})
    end

    private def month_params
    params.validation do
      required :name
      optional :year_id
      optional :customer_invoice_id
      optional :provider_invoice_id
        end
    end

    private def set_month
        @month = Month.find! params[:id]
    end
end
