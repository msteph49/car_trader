class Vehicle < ActiveRecord::Base
    belongs_to :user
    
    validates :make, :model, :year, :color, :user,
              :price, :mileage, :description, presence: true 

    validates :year, :mileage, numericality: { only_integer: true }
    validates :price, numericality: true 
end