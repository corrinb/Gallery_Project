class ChangeNull < ActiveRecord::Migration
  def change
    change_column_null :users, :profile_pic, true
  end
end
