class ChangeDefault < ActiveRecord::Migration
  def change
    change_column_default(:users, :profile_pic, nil)
  end
end
