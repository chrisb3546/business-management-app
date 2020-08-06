class CompletedJob < ApplicationRecord
  belongs_to :user

  def self.all_completed_jobs
   Job.completed.each do |job|
     CompletedJob.create(location: job.location, client_name: job.client.name, technician_name: job.service_technician.name, service_name: job.service.name, user: job.user)
     end
  end


end
