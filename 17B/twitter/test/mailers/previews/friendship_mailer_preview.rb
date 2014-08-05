# Preview all emails at http://localhost:3000/rails/mailers/friendship_mailer
class FriendshipMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/friendship_mailer/friendship_email
  def friendship_email
    FriendshipMailer.friendship_email
  end

end
