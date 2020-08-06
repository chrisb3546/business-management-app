class ServicesController < ApplicationController
    before_action :redirect_if_not_logged_in 
    

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
        @service = current_user.services.find_by(id: params[:id]) 
        not_found(@service)
    end

    def edit
        @service = current_user.services.find_by(id: params[:id])
        not_found(@service)
    end

    def update
        @service = current_user.services.find_by(id: params[:id])
        if @service.update(service_params)
           redirect_to service_path( @service)
        else 
            render :edit
        end
        
    end

    def destroy
        @service = current_user.services.find_by(id: params[:id]).destroy
        redirect_to services_path
    end



    private 
    def service_params
        params.require(:service).permit(:name, :description, :price, :user_id)
        
    end
end