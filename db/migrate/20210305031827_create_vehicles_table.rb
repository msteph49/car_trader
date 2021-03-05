class CreateVehiclesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.float :price
      t.text :description
    end
  end
end
