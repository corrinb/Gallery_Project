class User < ActiveRecord::Base
  mount_uploader :profile_pic, ProfilePhotoUploader

  has_many :images
  has_many :comments
  has_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_or_create_from_auth_hash(auth_hash)
    User.find_or_create_by(provider: auth_hash.provider, uid: auth_hash.uid) do |user|
      user.username = auth_hash.info.name
      user.profile_pic = auth_hash.info.image
      user.email = auth_hash.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def admin?
    role == "admin"
  end
end
