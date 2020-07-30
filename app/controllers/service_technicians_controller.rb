class ServiceTechniciansController < ApplicationController
    before_action :redirect_if_not_logged_in


    def index
        
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @service_technicians = @user.service_technicians
            redirect_if_not_authorized
           else
            redirect_to user_path(current_user)
        end

    end
    
    def new
        if params[:user_id] &&  @user = User.find_by(id: params[:user_id])
        @service_technician = @user.service_technicians.build
        redirect_if_not_authorized
        else 
            redirect_to user_path(current_user)#in case user isnt found to avoid error
        
        end
    end 

    def create 
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @service_technician = current_user.service_technicians.build(service_technician_params)
        redirect_if_not_authorized
            if @service_technician.save
           
            redirect_to user_service_technician_path(current_user, @service_technician)
            else 
            render :new 
            end
        end
    end

    def show
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @service_technician = ServiceTechnician.find_by(id: params[:id])
        redirect_if_not_authorized
        end
            if @service_technician.user_id != current_user.id
            redirect_to user_path(current_user.id)
            
        end
    end

    def edit
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @service_technician = ServiceTechnician.find_by(id: params[:id])
        redirect_if_not_authorized
        end
    end

    def update
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @service_technician = ServiceTechnician.find_by(id: params[:id])
            redirect_if_not_authorized
        end
        if @service_technician.update(service_technician_params)
           
                redirect_to user_service_technician_path(current_user, @service_technician)
        else 
                render :edit
        end
        
    end

    def destroy
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @service_technician = ServiceTechnician.find_by(id: params[:id]).destroy
            redirect_to user_service_technicians_path(current_user)
            end
    end



    private 
    def service_technician_params
        params.require(:service_technician).permit(:name, :user_id)
        
    end
end
