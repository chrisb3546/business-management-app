class Service < ApplicationRecord
  has_many :jobs
  has_many :service_technicians, through: :jobs
 
end
