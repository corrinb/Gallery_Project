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
    start_date (Date.today - 1.day)
    end_date (Date.today + 1.day)
  end

  factory :image do
    user
    gallery
    submission { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec',
      'support', 'images', 'mermaid.jpg')) }
    title "Beatiful Mermaid"
  end

  factory :comment do
    user
    image
    body "This mermaid is beautiful"
  end

  factory :theme do
    title 'Abstract Mermaids'
    vote_count 21
  end
end
