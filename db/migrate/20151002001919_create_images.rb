class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id, null: false
      t.integer :gallery_id, null: false
      t.string :submission, null: false
      t.string :title, null: false
      t.timestamps
    end
  end
end
