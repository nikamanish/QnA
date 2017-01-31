class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.integer :sender_id
      t.integer :group_id
      t.integer :reciever_id
      t.boolean :read, default: false
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
