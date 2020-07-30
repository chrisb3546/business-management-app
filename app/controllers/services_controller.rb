class ServicesController < ApplicationController
    before_action :redirect_if_not_logged_in


    def index
        
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @services = @user.services
            redirect_if_not_authorized
           else
            redirect_to user_path(current_user)
        end

    end
    
    def new
        if params[:user_id] &&  @user = User.find_by(id: params[:user_id])
        @service = @user.services.build
        redirect_if_not_authorized
        else 
            redirect_to user_path(current_user)#in case user isnt found to avoid error
        
        end
    end 

    def create 
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @service = current_user.services.build(service_params)
        redirect_if_not_authorized
            if @service.save
           
            redirect_to user_service_path(current_user, @service)
            else 
            render :new 
            end
        end
    end

    def show
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @service = Service.find_by(id: params[:id])
        redirect_if_not_authorized
        end
            if @service.user_id != current_user.id
            redirect_to user_path(current_user.id)
            
        end
    end

    def edit
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @service = Service.find_by(id: params[:id])
        redirect_if_not_authorized
        end
    end

    def update
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @service = Service.find_by(id: params[:id])
            redirect_if_not_authorized
        end
        if @service.update(service_params)
           
                redirect_to user_service_path(current_user, @service)
        else 
                render :edit
        end
        
    end

    def destroy
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @service = Service.find_by(id: params[:id]).destroy
            redirect_to user_services_path(current_user)
            end
    end



    private 
    def service_params
        params.require(:service).permit(:name, :description, :price, :user_id)
        
    end
end