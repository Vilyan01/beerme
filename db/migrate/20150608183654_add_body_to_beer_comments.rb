class AddBodyToBeerComments < ActiveRecord::Migration
  def change
    add_column :beer_comments, :body, :text
  end
end
