class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column(:users, :username, :string, null: false)
    add_column(:users, :profile_pic, :string, null: false)
    add_column(:users, :role, :string, default: 'member', null: false)
  end
end
