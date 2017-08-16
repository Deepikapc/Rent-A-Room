class Room < ActiveRecord::Base
	validates_presence_of :name,:description,:rules,:address
	validates_numericality_of :user_id,:city_id,:minimum_days,:latitude,:langitude,:price
	
	belongs_to :user
	belongs_to :city

	has_many :amenity_rooms
	has_many :amenities,through: :amenity_rooms
end
