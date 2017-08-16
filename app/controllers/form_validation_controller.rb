class FormValidationController < ApplicationController
	def mobile
		@user = User.find_by(mobile: params[:mobile_number])
	end
	def email
		@user = User.find_by(email: params[:email])
	end
	def username
		@user = User.find_by(username: params[:username])
	end
end
