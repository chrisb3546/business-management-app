class Job < ApplicationRecord
  belongs_to :Service
  belongs_to :Client
end
