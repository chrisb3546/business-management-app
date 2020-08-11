class ServiceTechniciansController < ApplicationController
    # before_action :redirect_if_not_logged_in
    before_action :find_service_technician, only: [:show, :edit, :update, :destroy]
    before_action only: [:show, :edit] do 
        not_found(@service_technician)
    end

    def index
        @service_technicians = current_user.service_technicians.search(params[:query])
    end
   
   def new
       @service_technician = current_user.service_technicians.build
   end 

   def create 
       @service_technician = current_user.service_technicians.build(service_technician_params)
       if @service_technician.save
          redirect_to service_technician_path(@service_technician)
       else 
           render :new 
       end
   end

   def show 
   end

   def edit
   end

   def update
       if @service_technician.update(service_technician_params)
          redirect_to service_technician_path(@service_technician)
       else 
           render :edit
       end
       
   end

    def destroy
       @service_technician.destroy
       redirect_to service_technicians_path
    end



    private 
    def service_technician_params
        params.require(:service_technician).permit(:name, :user_id)
    end


    def find_service_technician
        @service_technician = current_user.service_technicians.find_by(id: params[:id])
    end


end
