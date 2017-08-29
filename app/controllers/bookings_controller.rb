class BookingsController < ApplicationController
	before_action :authenticate_user!, except:[:index,:show]
	load_and_authorize_resource
	def index
	 @bookings = Booking.all
	end

	def new
	 @booking= Booking.new
	end

	def create
	 @booking= Booking.new(booking_params)
	 @booking.user_id = current_user.id 		 
		if @booking.save
		 	redirect_to  room_path(@booking.room_id)
		 else
		 	render new_booking_path
		 end				 
	end

	private
	def booking_params
		params[:booking].permit(:start_date,:end_date,:user_id,:room_id,:is_confirmed,:amount)
	end
end
