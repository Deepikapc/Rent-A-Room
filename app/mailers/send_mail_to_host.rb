class SendMailToHost < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_mail_to_host.host_confirmation.subject
  #

   #Admin authorizes host room(admin will send mail to host)
  def host_confirmation(room)     
  @room = room     
	   mail to: "#{@room.user.email}", subject: "Confirm the Room - #{@room.name}"
  end
end
