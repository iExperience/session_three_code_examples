# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tweet < ActiveRecord::Base
  belongs_to :user # tweets table has a user_id

  def self.for_user(handle)
    # returns all if handle is nil/false or handle is not a string
    return all unless handle && handle.is_a?(String)
    joins(:user).where(users: {handle: sanitize(handle)})
  end

  def self.search(query)
    return all unless query
    # where("content LIKE ?", "%#{query}%")
    where(arel_table[:content].matches("%#{query}%"))
  end

  def self.create_for_user_handle(handle, params)
    user = User.find_by(handle: sanitize(handle))
    create(params.merge(user: user))
  end

  def self.sanitize(handle)
    handle.start_with?("@") ? handle : "@#{handle}"
  end
end
