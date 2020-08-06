class CompletedJobsController < ApplicationController
before_action :redirect_if_not_logged_in
    
# def create
#     @completed_job = current_user.jobs.completed
#     if @completed_job.save
#         redirect_to completed_jobs_path
#     end
# end



def index
         @completed_jobs = current_user.completed_jobs.uniq
end


end 