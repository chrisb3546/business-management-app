class Job < ApplicationRecord
  belongs_to :service_technician, optional: true
  belongs_to :client, optional: true
  belongs_to :service, optional: true
  belongs_to :user
  validates :location, presence: true
  validates :duration, presence: true
  
  scope :search, -> (query) {joins(:user).where("location LIKE ?","%#{query}%" )}
 
end 

