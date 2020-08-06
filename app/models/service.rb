class Service < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_many :service_technicians, through: :jobs
  has_many :clients, through: :jobs
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  scope :search, -> (query) {joins(:user).where("name LIKE ?","%#{query}%" )}
  
  
  
end
