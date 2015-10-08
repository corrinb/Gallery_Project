class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :theme
  validates :theme, presence: true, uniqueness: { scope: :user }
  validates :vote, inclusion: { in: 0..1 }
end
