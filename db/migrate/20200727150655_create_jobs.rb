class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :Service, null: false, foreign_key: true
      t.belongs_to :Client, null: false, foreign_key: true
      t.text :location
      t.string :duration
      t.text :notes

      t.timestamps
    end
  end
end
