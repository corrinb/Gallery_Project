class DropColumns < ActiveRecord::Migration
  def change
    remove_column :users, :username
    remove_column :users, :profile_pic
  end
end
