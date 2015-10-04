require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    username 'username'
    profile_pic 'face.jpg'
    role 'member'
  end

  factory :gallery do
    theme 'aquatic'
  end

  factory :image do
    user
    gallery
    submission "mermaid.png"
    title "Beatiful Mermaid"
  end
end
