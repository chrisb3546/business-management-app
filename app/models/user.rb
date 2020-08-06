class User < ApplicationRecord
    has_many :service_technicians, dependent: :destroy
    has_many :jobs, dependent: :destroy
    has_many :services, dependent: :destroy
    has_many :clients, dependent: :destroy
    has_secure_password
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true 
end
