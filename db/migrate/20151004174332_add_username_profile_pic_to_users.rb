class AddUsernameProfilePicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :profile_pic, :string
  end
end
