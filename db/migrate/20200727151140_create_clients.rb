class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.text :location
      t.belongs_to :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
