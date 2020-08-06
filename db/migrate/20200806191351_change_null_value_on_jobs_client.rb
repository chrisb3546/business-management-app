class ChangeNullValueOnJobsClient < ActiveRecord::Migration[6.0]
  def change
    change_column_null :jobs, :client_id, true
  end
end
