class InvitationsController < ApplicationController
  def new
  end

  def search
  	name = (params[:invite][:name]).downcase
  	result = User.select(:id).where("lower(name) like ?", "%#{name}%")
  	flash[:invite] = result
  	
  	redirect_to invitations_new_path
  end

  def create
  	receiver_id = params[:invite][:id]
  	group_id = params[:invite][:group_id].to_i
  	sender_id = current_user.id

  	invitation = Invitation.new(sender_id: sender_id, receiver_id: receiver_id, group_id: group_id)
  	invitation.save
  	redirect_to current_user
  end

  def respond
  	id = params[:invite][:id].to_i
  	group_id = params[:invite][:group_id].to_i
  	invitation = Invitation.find_by(id: id)
  	invitation.update_attribute(:accepted, true)  	

  	if params[:commit] == "Yes"
  		membership = Membership.new(user_id: current_user.id, group_id: group_id)
  		membership.save
  	end
  	redirect_to current_user
  end
end
