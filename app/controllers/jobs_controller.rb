class JobsController < ApplicationController
    before_action :find_job, only: [:show, :edit, :update, :destroy]
    before_action only: [:show, :edit] do 
        not_found(@job)
    end

    def index
        if params[:service_technician_id] && @service_technician = ServiceTechnician.find_by_id(params[:service_technician_id])
           @jobs = @service_technician.jobs
            redirect_if_not_authorized(@service_technician)
        else
            @jobs = current_user.jobs.search(params[:query])
        end
    end
    
    def new
        if params[:service_technician_id] && @service_technician = ServiceTechnician.find_by(id: params[:service_technician_id])
            @job = @service_technician.jobs.build
            redirect_if_not_authorized(@service_technician)
        else 
            @job = current_user.jobs.build
        end
        
    end 

    def create 
        if params[:service_technician_id] && @service_technician = ServiceTechnician.find_by(id: params[:service_technician_id])
            @job = @service_technician.user.jobs.build(job_params)
            redirect_if_not_authorized(@service_technician)
        else 
            @job = current_user.jobs.build(job_params)
        end
        if @job.save 
            redirect_to job_path(@job)
        else 
            render :new 
        end
    end

    def show
    end

    def edit
    end

    def update
        if @job.update(job_params) 
            redirect_to job_path(@job)
        else 
            render :edit
        end
    end

    def destroy
        @job.destroy
        redirect_to jobs_path
    end


    private
    def job_params
        params.require(:job).permit(:service_technician_id, :client_id, :service_id, :user_id, :location, :duration, :notes, :scheduled_for?, :job_time_zone, :completed)
    end

    def find_job
        @job = current_user.jobs.find_by(id: params[:id])
    end

    

end
