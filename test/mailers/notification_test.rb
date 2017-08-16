require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "admin_mail_confirmation" do
    mail = Notification.admin_mail_confirmation
    assert_equal "Admin mail confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
