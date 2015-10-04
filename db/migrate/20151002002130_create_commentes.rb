class CreateCommentes < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :image_id, null: false
      t.string :body, null: false
    end
  end
end
