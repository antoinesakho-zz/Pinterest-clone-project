class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
          :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :image, :email, :password, :name, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  attr_accessor :image_file_name
  attr_accessor :image_content_type
  attr_accessor :image_file_size
  attr_accessor :image_updated_at
  validates_presence_of :name
  has_attached_file :image, styles: { medium: "320x240"}
  validates_attachment :image, 
                  content_type: {content_type: ['image/jpg', 'image/jpeg', "image/png", "image/gif"]},
                  size: {less_than: 5.megabytes}

  has_many :pins, :dependent => :destroy
end