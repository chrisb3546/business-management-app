class Client < ApplicationRecord
  belongs_to :user
  has_many :jobs
  has_many :service_technicians, through: :jobs
  has_many :services, through: :jobs
end
