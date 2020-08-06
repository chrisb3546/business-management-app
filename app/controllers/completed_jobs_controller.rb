class CompletedJobsController < ApplicationController
before_action :redirect_if_not_logged_in
    



    def index
         @completed_jobs = current_user.completed_jobs.search(params[:query])
    end

    def show
        @completed_job = current_user.completed_jobs.find_by(id: params[:id])
        not_found(@completed_job)
    end

    def destroy
        @completed_job= current_user.completed_jobs.find_by(id: params[:id]).destroy
        redirect_to completed_jobs_path
    end

private

    def completed_job_params
        params.require(:completed_job).permit(:location, :client_name, :technician_name, :service_name, :user_id, :completed_on)
    end




end 