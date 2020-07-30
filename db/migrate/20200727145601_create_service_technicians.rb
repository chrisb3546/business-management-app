class CreateServiceTechnicians < ActiveRecord::Migration[6.0]
  def change
    create_table :service_technicians do |t|
      t.string :name
      t.string :services
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
