class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.admin_mail_confirmation.subject
  #
  def admin_mail_confirmation(room) 
   @room = room

    mail to: "#{room.user.email}", subject: "Your room has been confirmed - #{room.name}"
  end
end
