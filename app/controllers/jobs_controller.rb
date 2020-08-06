class JobsController < ApplicationController
    before_action :redirect_if_not_logged_in

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
            @job = current_user.jobs.build#in case user isnt found to avoid error
        end
        
    end 

    def create 
        if params[:service_technician_id] && @service_technician = ServiceTechnician.find_by(id: params[:service_technician_id])
            @job = @service_technician.user.jobs.build(job_params)
            redirect_if_not_authorized(@service_technician)
        else 
            @job = current_user.jobs.build(job_params)
        end
            if @job.save && @job.completed == false
                redirect_to job_path(@job)
            elsif @job.completed == true
                CompletedJob.all_completed_jobs
                @job.destroy
                redirect_to completed_jobs_path

            else 
                render :new 
           
        end
    end

    def show
        @job = current_user.jobs.find_by(id: params[:id]) 
        not_found(@job)
    end

    def edit
        @job = current_user.jobs.find_by(id: params[:id])
        not_found(@job)
    end

    def update
        @job = current_user.jobs.find_by(id: params[:id])
        if @job.update(job_params) && @job.completed == false
            redirect_to job_path(@job)
        elsif @job.completed == true
            CompletedJob.all_completed_jobs
            @job.destroy
            redirect_to completed_jobs_path
        else 
            render :edit
        end
    end

    def destroy
        @job = current_user.jobs.find_by(id: params[:id]).destroy
        redirect_to jobs_path
    end


    private
    def job_params
        params.require(:job).permit(:service_technician_id, :client_id, :service_id, :user_id, :location, :duration, :notes, :scheduled_for?, :completed, :query => {})
    end
end
