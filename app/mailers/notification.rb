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

  #sending booking mail to host
  def send_booking_mail_to_host(booking)
    @booking = booking
    @host_email_id = User.find(@booking.user_id).email
    #binding.pry
    mail to: "#{@host_email_id}", subject: "A New booking request- #{@booking.room.name}"
  end


end
