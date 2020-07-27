class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.belongs_to :ServiceTech, null: false, foreign_key: true

      t.timestamps
    end
  end
end
