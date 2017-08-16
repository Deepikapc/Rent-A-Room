class Amenity < ActiveRecord::Base
	validates_presence_of :name,:description

	belongs_to :user
	
	has_many :amenity_rooms
	has_many :rooms,through: :amenity_rooms
end
