class JobsController < ApplicationController
    def index
    @jobs = Job.all        
    end

    def show
        @job = Job.find_by(id: params[:id])
     end

    def new
        @job = Job.new

    end

    def create
        @job = Job.new(job_params)
    end

    private
    def job_params
        params.require(:job).permit(:service_technician_id, :client_id, :service_id, :location, :duration, :notes, :scheduled_for?, :completed?)
    end
end
