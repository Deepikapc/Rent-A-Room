class Room < ActiveRecord::Base
	validates_presence_of :name,:description,:rules,:address
	validates_numericality_of :user_id,:city_id,:minimum_days,:latitude,:langitude,:price

	belongs_to :user
	belongs_to :city
	has_many :images
	
	accepts_nested_attributes_for :images

	has_many :amenity_rooms
	has_many :amenities,through: :amenity_rooms

	after_create :set_user_host

	after_create :send_mail_to_admin

	after_update :host_confirmation

	def set_user_host
		host_role = Role.find_by('name=?',"host").id
	    admin_role = Role.find_by('name=?',"admin").id

		if self.user.role_id == admin_role
			self.user.role_id = admin_role
		else
			self.user.role_id = host_role
			self.user.save
		end	
		 
	end

	def role?(role)
      self.user.role.name == role
    end


    #sending mail to admin saying confirm the room
    def send_mail_to_admin
    	Notification.send_mail_to_admin(self).deliver!
    end

    # sending mail to host saying Room has been confirmed

    def host_confirmation
    	#binding.pry
    	SendMailToHost.host_confirmation(self).deliver!
    end

end
