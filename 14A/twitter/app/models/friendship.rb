# == Schema Information
#
# Table name: friendships
#
#  id        :integer          not null, primary key
#  user_id   :integer
#  friend_id :integer
#

class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User",
             :foreign_key => "friend_id"

  after_create :send_friendship_email

  protected

  def send_friendship_email
    FriendshipMailer.friendship_email(self).deliver
  end
end
