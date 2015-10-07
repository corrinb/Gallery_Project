class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :title, null: false
      t.integer :vote_count, null: false, default: 0
      t.timestamps
    end
  end
end
