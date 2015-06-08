class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :beer, index: true
      t.float :qty
      t.string :measurement
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :ingredients, :beers
  end
end
