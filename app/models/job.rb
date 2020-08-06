class Job < ApplicationRecord
  belongs_to :service_technician
  belongs_to :client
  belongs_to :service, optional: true
  belongs_to :user
  validates :location, presence: true
  validates :duration, presence: true
  
  scope :search, -> (query) {joins(:user).where("location LIKE ?","%#{query}%" )}
  scope :completed, -> {joins(:user).where("completed = true")}
  

  # def self.search(query)
    
  # Job.joins(:user).where("location LIKE ?","%#{query}%" )
  # end

end 

# ("#{job.client.name} LIKE ?","%#{query}%")