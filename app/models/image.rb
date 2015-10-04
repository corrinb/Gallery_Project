class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :gallery
  has_many :comments

  validates :user_id, presence: true
  validates :gallery_id, presence: true
  validates :submission, presence: true
  validates :title, presence: true
end
