class CreateBeerComments < ActiveRecord::Migration
  def change
    create_table :beer_comments do |t|
      t.references :beer, index: true
      t.boolean :like
      t.integer :user_id

      t.timestamps null: false
    end
    add_foreign_key :beer_comments, :beers
  end
end
