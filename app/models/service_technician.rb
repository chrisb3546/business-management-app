class ServiceTechnician < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_many :services, through: :jobs
  has_many :clients, through: :jobs
  validates :name, presence: true
  
  scope :search, -> (query) {joins(:user).where("name LIKE ?","%#{query}%" )}

  

end
