class ImagesController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	
	def index
		@images = Image.all
	end
	def new		
		@image = Image.new			
	end
	def create
		@image = Image.new(image_params)
		@image.room_id = Room.find_by(current_user.id).id
		if @image.save
			redirect_to images_path
		else
			render new_image_path
		end
	end
	def show
		@image = Image.find(params[:id])
	end
	def edit
		@image = Image.find(params[:id])
	end
	def update
		@image = Image.find(params[:id])
		if @image.update_attributes(image_params)
			redirect_to image_path(@image.id) 
		else
			redirect_to edit_image_path
		end
	end
	def destroy
		@image = Image.find(params[:id])
		@image.destroy
		redirect_to images_path
	end

	def image_params
		params[:image].permit(:image,:room_id)
	end
end
