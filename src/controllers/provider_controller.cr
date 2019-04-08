class ProviderController < ApplicationController
    getter provider = Provider.new
    
    before_action do
      only [:show, :edit, :update, :destroy] { set_provider }
    end

    def index
      providers = Provider.all
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
        provider = Provider.new provider_params.validate!
      if provider.save
        redirect_back(
          flash: {"success" => "Fournisseur créer"})
      else
        flash[:danger] = "Could not create Provider!"
        render "new.ecr"
      end
    end
  
    def update
        provider.set_attributes provider_params.validate!
      if provider.save
        redirect_to action: :index, flash: {"success" => "Fournisseur édité"}
      else
        flash[:danger] = "Could not update Provider!"
        render "edit.ecr"
      end
    end
  
    def destroy
      provider.destroy
      redirect_to action: :index, flash: {"success" => "Fournisseur supprimé"}
    end

    private def provider_params
    params.validation do
      required :name
        end
    end

    private def set_provider
        @provider = Provider.find! params[:id]
    end
end
