class CreateListsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.string :content
      t.string :category
      t.integer :user_id
     end
  end
end
