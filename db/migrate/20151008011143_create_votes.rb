class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :theme_id, null: false
      t.integer :vote, null: false, default: 0
    end
  end
end
