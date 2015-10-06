module OmniAuthTestHelper
  def mock_facebook_auth!
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      "provider" => "facebook",
      "uid" => "123456",
      "info" => {
        "email" => "jarlax@launchacademy.com",
        "name" => "Alex Jarvis",
        "image" => "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
      },
      "credentials" => {
        "token" => "1234",
        "expires" => false
      },
      "extra" => {
        "raw_info" => {
        }
      }
    )
  end
end
