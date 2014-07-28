# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  handle     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, :dependent => :destroy
  has_many :friendships
  has_many :friends, :through => :friendships

  validates :handle, :length => {:minimum => 3}

  def self.search(query)
    return all unless query
    # where("handle LIKE ?", "%#{query}%")
    where(arel_table[:handle].matches("%#{query}%"))
  end

end
