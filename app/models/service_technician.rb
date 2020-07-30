class ServiceTechnician < ApplicationRecord
  belongs_to :user
  has_many :jobs
  has_many :services, through: :jobs
  has_many :clients, through: :jobs
  validates :name, presence: true



end
