class Service < ApplicationRecord
  belongs_to :user
  has_many :jobs,  :dependent => :destroy
  has_many :service_technicians, through: :jobs, :dependent => :destroy
 
end
