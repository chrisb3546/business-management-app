class ServicesController < ApplicationController
    # before_action :redirect_if_not_logged_in 
    before_action :find_service, only: [:show, :edit, :update, :destroy]
    before_action only: [:show, :edit] do 
        not_found(@service)
    end
    

    def index
         @services = current_user.services.search(params[:query])
    end
    
    def new
        @service = current_user.services.build
    end 

    def create 
        @service = current_user.services.build(service_params)
        if @service.save
           redirect_to service_path(@service)
        else 
            render :new 
        end
    end

    def show
    end

    def edit
    end

    def update
        if @service.update(service_params)
           redirect_to service_path( @service)
        else 
            render :edit
        end
        
    end

    def destroy
        @service.destroy
        redirect_to services_path
    end



    private 
    def service_params
        params.require(:service).permit(:name, :description, :price, :user_id)
    end

    def find_service
        @service = current_user.services.find_by(id: params[:id])
    end
end