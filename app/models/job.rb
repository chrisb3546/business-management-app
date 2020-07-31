class Job < ApplicationRecord
  belongs_to :service_technician
  belongs_to :client
  belongs_to :service
  belongs_to :user
end
