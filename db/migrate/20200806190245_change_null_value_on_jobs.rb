class ChangeNullValueOnJobs < ActiveRecord::Migration[6.0]
  def change
    change_column_null :jobs, :service_id, true
  end
end
