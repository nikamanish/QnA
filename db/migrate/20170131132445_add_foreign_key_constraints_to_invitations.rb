class AddForeignKeyConstraintsToInvitations < ActiveRecord::Migration[5.0]
  def change
  		rename_column :invitations, :reciever_id, :receiver_id
  	  	add_foreign_key :invitations, :users, column: :sender_id
  	  	add_foreign_key :invitations, :users, column: :receiver_id
  	  	add_foreign_key :invitations, :groups
  end
end
