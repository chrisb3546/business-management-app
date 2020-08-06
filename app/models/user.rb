class User < ApplicationRecord
    has_many :service_technicians
    has_many :jobs
    has_many :completed_jobs
    has_many :services 
    has_many :clients
    has_secure_password
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true 
  

    # def google
    #     where(email: auth.info.email).first_or_initialize do |user|
    #         user.username = auth.info.
    #         user.email = auth.info.email
    #         user.password = SecureRandom.hex
    #       end
    #     end

    

    # def self.search(query)
    #    User.joins(:jobs).where("location LIKE ?","%#{query}%" )
    # end
    
    
end
