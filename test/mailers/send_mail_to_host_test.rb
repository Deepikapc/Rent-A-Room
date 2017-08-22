require 'test_helper'

class SendMailToHostTest < ActionMailer::TestCase
  test "host_confirmation" do
    mail = SendMailToHost.host_confirmation
    assert_equal "Host confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
