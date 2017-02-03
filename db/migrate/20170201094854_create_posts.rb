class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :membership_id
      t.integer :upvotes, default: 0
      t.integer :downvote, default: 0

      t.timestamps
    end
    add_foreign_key :posts, :memberships
  end
end