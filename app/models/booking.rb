class Booking < ActiveRecord::Base
	belongs_to :room
	belongs_to :user

	validate :checking_booking_date
	after_create :send_booking_mail_to_host
	
	def checking_booking_date
			#binding.pry
		date_array = []
		booked_room = Booking.where('room_id=?',self.room.id)

		date_array = (self.start_date..self.end_date).to_a
				
			booked_room.each do |booking|
				#binding.pry
				if(date_array.include?(booking.start_date) || date_array.include?(booking.end_date))
					self.errors.add(:base, "You can not book a room,Because these dates already taken")		
					elsif(self.start_date > (self.end_date) || self.end_date < (self.start_date))
						self.errors.add(:base, "End Date can not be less than start_date")	
					break		
				end
			end							
	end

	

	#sending booking mail to host
	def send_booking_mail_to_host
	    Notification.send_booking_mail_to_host(self).deliver!
	end

	def role?(role)
      self.user.role.name == role
    end

end
