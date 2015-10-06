class User < ActiveRecord::Base
  has_many :images
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_or_create_from_auth_hash(auth_hash)
    User.find_or_create_by(provider:)
  end

  def admin?
    role == "admin"
  end
end
