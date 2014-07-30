require 'test_helper'

class FriendshipMailerTest < ActionMailer::TestCase
  test "friendship_email" do
    mail = FriendshipMailer.friendship_email
    assert_equal "Friendship email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
