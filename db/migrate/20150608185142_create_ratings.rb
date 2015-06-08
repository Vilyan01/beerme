class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :beer_id, index: true
      t.boolean :like
      t.integer :user_id

      t.timestamps null: false
    end
    add_foreign_key :ratings, :beer_ids
  end
end
