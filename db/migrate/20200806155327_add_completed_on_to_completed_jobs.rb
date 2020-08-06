class AddCompletedOnToCompletedJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :completed_jobs, :completed_on, :datetime
  end
end
