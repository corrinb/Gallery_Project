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
    submission "mermaid.jpg"
    title "Beatiful Mermaid"
  end

  factory :comment do
    user
    image
    body "This mermaid is beautiful"
  end
end
