class YearController < ApplicationController
    getter year = Year.new
    
    before_action do
        only [:show, :edit, :update, :destroy] { set_year }
    end

    def index
      years = Year.all
      render "index.ecr"
    end
  
    def show
      months = Month.all("WHERE year_id = ?", params[:id])
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
        year = Year.new year_params.validate!
      if year.save
        redirect_to action: :index, flash: {"success" => "Created year successfully."}
      else
        flash[:danger] = "Could not create Year!"
        render "new.ecr"
      end
    end
  
    def update
      years = Year.all
        year.set_attributes year_params.validate!
      if year.save
        redirect_to action: :index, flash: {"success" => "Updated year successfully."}
      else
        flash[:danger] = "Could not update Year!"
        render "edit.ecr"
      end
    end
  
    def destroy
      year.destroy
      redirect_to action: :index, flash: {"success" => "Deleted year successfully."}
    end

    private def year_params
    params.validation do
      required :name
        end
    end

    private def set_year
        @year = Year.find! params[:id]
    end
end
