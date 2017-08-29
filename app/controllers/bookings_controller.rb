class BookingsController < ApplicationController
	def index
	 @books	= Booking.all
	end
	def new
	 @book= Booking.new
	end
	def create
	 @book= Booking.new(booking_params)
	 @book.user_id = current_user.id
	 date_array = []
	 	
	 #binding.pry
		booking_start_date = Booking.where('start_date = ? AND room_id = ?',booking_params[:start_date],booking_params[:room_id])
		
		booking_end_date = Booking.where('end_date = ? AND room_id = ?',booking_params[:end_date],booking_params[:room_id])
		if booking_start_date.present? || booking_end_date.present?
			@bookings_error = true
			
			render new_booking_path
		else
			if @book.save
		 	redirect_to  bookings_path
		 else
		 	render new_booking_path
		 end

		end		 
	end

	private
	def booking_params
		params[:booking].permit(:start_date,:end_date,:user_id,:room_id,:is_confirmed,:amount)
	end
end
