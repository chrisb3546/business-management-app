class Service < ApplicationRecord
  belongs_to :user
  has_many :jobs,  :dependent => :destroy
  has_many :service_technicians, through: :jobs, :dependent => :destroy
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
end
