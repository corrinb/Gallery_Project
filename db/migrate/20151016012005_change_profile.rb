class ChangeProfile < ActiveRecord::Migration
  def change
    change_column(:users, :profile_pic, :string, null: false, default: '/maggie-smith.jpg')
  end
end
