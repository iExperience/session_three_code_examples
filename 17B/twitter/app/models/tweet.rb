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
  paginates_per 10

  has_one :image, as: :imageable

  def self.for_user(handle)
    # returns all if handle is nil/false or handle is not a string
    return all unless handle && handle.is_a?(String)
    joins(:user).where(users: {handle: handle})
  end

  def self.search(query)
    return all unless query
    # where("content LIKE ?", "%#{query}%")
    where(arel_table[:content].matches("%#{query}%"))
  end

  def self.create_for_user(user, params)
    create(params.merge(user: user))
  end

end
