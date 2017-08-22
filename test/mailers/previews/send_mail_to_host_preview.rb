# Preview all emails at http://localhost:3000/rails/mailers/send_mail_to_host
class SendMailToHostPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/send_mail_to_host/host_confirmation
  def host_confirmation
    SendMailToHost.host_confirmation
  end

end
