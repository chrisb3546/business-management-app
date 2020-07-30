class ServicesController < ApplicationController
    def index
        
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @services = @user.services
            redirect_if_not_authorized
           else
            redirect_to user_path(current_user)
        end

    end

    def show
        @service = Service.find_by(id: params[:id])
    end

    def new
        @service = Service.new
    end

    def create
        @service = Service.new(service_params)
        if @service.save
          
            redirect_to user_service_path(@service)
        else 
            render :new 
        end
    end

    private

    def service_params
        params.require(:service).permit(:name, :description, :price)
    end

end
