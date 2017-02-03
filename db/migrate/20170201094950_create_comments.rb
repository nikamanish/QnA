class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :content
      t.integer :likes, default: 0
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :comments, :posts
    add_foreign_key :comments, :users
  end
end
