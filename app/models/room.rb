class Room < ActiveRecord::Base
	validates_presence_of :name,:description,:rules,:address
	validates_numericality_of :user_id,:city_id,:minimum_days,:latitude,:langitude,:price
	
	belongs_to :user
	belongs_to :city
	belongs_to :user

	has_many :amenity_rooms
	has_many :amenities,through: :amenity_rooms

	after_create :set_user_host

	def set_user_host
	 host_role = Role.third
	 # admin_role = Role.second
	 self.user.role_id = host_role.id
	 user.save
	end

	def role?(role)
      self.user.role.name == role
    end
end
