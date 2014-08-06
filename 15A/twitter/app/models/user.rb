# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  handle                 :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  email                   :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  role                   :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, :dependent => :destroy
  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :images, as: :imageable

  accepts_nested_attributes_for :images

  validates :handle, :length => {:minimum => 3}

  def self.search(query)
    return all unless query
    # where("handle LIKE ?", "%#{query}%")
    where(arel_table[:handle].matches("%#{query}%"))
  end

  def admin?
    # self.role == "admin"
    role == "admin"
  end

  def following?(other_user)
    friendships.find_by(friend_id: other_user.id)
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create( handle: auth.info.last_name,
                            provider: auth.provider,
                            uid: auth.uid,
                            email: auth.info.email,
                            password: Devise.friendly_token[0,20]
                          )
      end    
    end
  end

end
