class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :service_technician, null: false, foreign_key: true
      t.belongs_to :client, null: false, foreign_key: true
      t.belongs_to :service, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.text :location
      t.string :duration
      t.text :notes
      t.datetime :scheduled_for?
      t.boolean :completed?, default: false

      t.timestamps
    end
  end
end
