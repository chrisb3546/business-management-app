class CreateCompletedJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :completed_jobs do |t|
      t.string :location
      t.string :client_name
      t.string :technician_name
      t.string :service_name
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
