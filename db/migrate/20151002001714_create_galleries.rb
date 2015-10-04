class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :theme, null: false
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
