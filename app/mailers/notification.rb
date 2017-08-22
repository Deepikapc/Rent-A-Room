class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.admin_mail_confirmation.subject
  #

  #while creating room sending room to admin
  def send_mail_to_admin(room) 
   @room = room
    admin_email_id = User.find_by(role_id:Role.find_by(name:"admin").id).email
    mail to: "#{admin_email_id}", subject: "please confirm the room - #{room.name}"
  end

  # #Admin authorizes host room(admin will send mail to host)
  # def send_mail_to_host(room)
  # @room = room     
	 #   mail to: "#{room.user.email}", subject: "confirm the room - #{room.name}",body: "Your Room has confirmed"
  # end

end
