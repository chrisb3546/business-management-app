class User < ApplicationRecord
    has_many :service_technicians
    has_many :jobs
    has_many :services 
    has_many :clients
    has_secure_password
    validates :username, presence: true
    validates :email, presence: true

    
end
