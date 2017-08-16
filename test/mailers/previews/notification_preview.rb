# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification/admin_mail_confirmation
  def admin_mail_confirmation
    Notification.admin_mail_confirmation
  end

end
