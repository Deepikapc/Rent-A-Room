class RoomsController < ApplicationController
	def index
	 @rooms	= Room.all
	end

	def new
	 @room = Room.new
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
	end

	def edit
		@room = Room.find(params[:id])
	end

	def update
		@room = Room.find(params[:id])
    
    if @room .update_attributes(room_params)
      redirect_to rooms_path(@room.id), notice: "Successfully updated from "
    else
      render action: "edit"
    end
	end

	def destroy
		@room = Room.find(params[:id])
		@room.destroy
		redirect_to rooms_path
	end
	private
	def room_params
		params[:room].permit(:name,:description,:price,:rules,:minimum_days,:address,:langitude,:latitude,:is_authorized,:city_id,:user_id,amenity_ids: [])
	end
end
