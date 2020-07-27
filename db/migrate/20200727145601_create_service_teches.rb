class CreateServiceTeches < ActiveRecord::Migration[6.0]
  def change
    create_table :service_teches do |t|
      t.string :name
      t.string :services
      t.belongs_to :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
