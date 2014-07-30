class FriendshipMailer < ActionMailer::Base
  default from: "no-reply@notrealtwitter.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.friendship_mailer.friendship_email.subject
  #
  def friendship_email(friendship)
    @follower = friendship.user

    mail to: friendship.friend.email
  end
end
