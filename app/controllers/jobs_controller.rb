class JobsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @jobs = @user.jobs
            redirect_if_not_authorized
           else
            redirect_to user_path(current_user)
        end

    end
    
    def new
        if params[:user_id] &&  @user = User.find_by(id: params[:user_id])
        @job = @user.jobs.build
        redirect_if_not_authorized
        else 
            redirect_to user_path(current_user)#in case user isnt found to avoid error
        
        end
    end 

    def create 
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @job = current_user.jobs.build(job_params)
        redirect_if_not_authorized
            if @job.save
           
            redirect_to user_job_path(current_user, @job)
            else 
            render :new 
            end
        end
    end

    def show
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @job = Job.find_by(id: params[:id])
        redirect_if_not_authorized
        end
            if @job.user_id != current_user.id
            redirect_to user_path(current_user.id)
            
        end
    end

    def edit
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @job = Job.find_by(id: params[:id])
        redirect_if_not_authorized
        end
    end

    def update
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @job = Job.find_by(id: params[:id])
            redirect_if_not_authorized
        end
        if @job.update(job_params)
           
                redirect_to user_job_path(current_user, @job)
        else 
                render :edit
        end
        
    end

    def destroy
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @job = Job.find_by(id: params[:id]).destroy
            redirect_to user_jobs_path(current_user)
            end
    end


    private
    def job_params
        params.require(:job).permit(:service_technician_id, :client_id, :service_id, :user_id, :location, :duration, :notes, :scheduled_for?, :completed?)
    end
end
