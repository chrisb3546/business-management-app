class Client < ApplicationRecord
  belongs_to :user
  has_many :jobs
  has_many :service_technicians, through: :jobs
  has_many :services, through: :jobs
  validates :name, presence: true
  validates :location, presence: true

  scope :search, -> (query) {joins(:user).where("name LIKE ?","%#{query}%" )}
  

end
