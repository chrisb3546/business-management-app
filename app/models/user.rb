class User < ApplicationRecord
    has_many :service_technicians
    has_many :jobs, through: :service_technicians

    
end
