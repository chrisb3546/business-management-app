class AddTimeZoneToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :job_time_zone, :string
  end
end
