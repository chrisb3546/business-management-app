class AddCompletedToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :completed, :boolean
  end
end
