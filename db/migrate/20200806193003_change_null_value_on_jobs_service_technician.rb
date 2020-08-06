class ChangeNullValueOnJobsServiceTechnician < ActiveRecord::Migration[6.0]
  def change
    change_column_null :jobs, :service_technician_id, true
  end
end
