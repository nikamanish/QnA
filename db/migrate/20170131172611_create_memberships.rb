class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :group_id
      t.boolean :admin, default: false

      t.timestamps
    end
    add_foreign_key :memberships, :users
    add_foreign_key :memberships, :groups
  end
end
