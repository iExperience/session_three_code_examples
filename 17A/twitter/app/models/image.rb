class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true


  has_attached_file :attachment,
    :styles => { :medium => "300x300>", 
                 :thumb => "100x100>" },
    :default_url => "/images/users/:style.png"

  validates_attachment_content_type :attachment,
    :content_type => /\Aimage\/.*\Z/
end