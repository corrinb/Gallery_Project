class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :gallery

  validates :user_id, presence: true
  validates :gallery_id, prsence: true
  validates :submission, presence: true
  validates :title, prsence: true
end
