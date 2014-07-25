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
  has_many :tweets, :dependent => :destroy
  has_many :friendships
  has_many :friends, :through => :friendships
end
