require_relative '../uploaders/picture_uploader'

class Vehicle < ActiveRecord::Base
    mount_uploader :picture, PictureUploader

    belongs_to :user
    
    validates :make, :model, :year, :color, :user, 
              :price, :mileage, :description, presence: true 

    validates :year, :mileage, numericality: { only_integer: true }
    validates :price, numericality: true 
end