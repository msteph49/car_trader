class AddColorMileageToVehicleTable < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :color, :string
    add_column :vehicles, :mileage, :string
  end
end
