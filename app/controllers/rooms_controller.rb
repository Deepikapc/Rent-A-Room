class RoomsController < ApplicationController
	before_action :authenticate_user!, except:[:index,:show]
	load_and_authorize_resource

  def index
	 @rooms	= Room.all	
  end

  def new	
	@room = Room.new
	@image = Image.new
  end

  def create
	@room = Room.new(room_params)
	 if @room.save
	 	redirect_to rooms_path
	 else
	 	render new_room_path
	 end	
  end

  def show
	@room = Room.find(params[:id])
	@booking = Booking.new
  end

  def edit
	@room = Room.find(params[:id])
  end

def update
	@room = Room.find(params[:id])
		if @room .update_attributes(room_params)
		     redirect_to rooms_path(@room.id)
		else
		    render action: "edit"
	   end
end

def destroy
	@room = Room.find(params[:id])
	@room.destroy
	redirect_to rooms_path
end
def unauthorized
	authorize! :unauthorized,Room.new
	@room = Room.new
	@rooms = Room.where('is_authorized = ?' ,false)	
end
def myroom
	authorize! :myroom,Room.new
	@rooms = Room.all
	@myroom_array = []
	@rooms.each do |room|
		if room.user_id == current_user.id
			@myroom_array << room
		end
	end		
end

	private
	def room_params
		params[:room].permit(:name,:description,:price,:rules,:minimum_days,:address,:langitude,:latitude,:is_authorized,:city_id,:user_id,amenity_ids: [], images_attributes:[:id,:image,:room_id])
	end
end
