class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.text :description
      t.float :og
      t.float :fg
      t.float :abv
      t.string :color
      t.text :instructions
      t.integer :added_by

      t.timestamps null: false
    end
  end
end
