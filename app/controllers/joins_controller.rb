class JoinsController < ApplicationController
  def new
  end

  def search
  	group_name = (params[:join][:name]).downcase
  	result = Group.select(:id).where("lower(name) like ?", "%#{group_name}%")
  	flash[:join] = result
  	redirect_to new_join_path
  end

  def create
  	group_id = params[:join][:id].to_i
  	
  	sender_id = current_user.id

  	request = Request.new(sender_id: sender_id, group_id: group_id)
  	request.save
  	redirect_to current_user
  end

  def respond
  	id = params[:join][:id].to_i
  	group_id = params[:join][:group_id].to_i
  	user_id = params[:join][:user_id].to_i

  	request = Request.find_by(id: id)
  	request.update_attribute(:granted, true)  	

  	if params[:commit] == "Yes"
  		membership = Membership.new(user_id: user_id, group_id: group_id)
  		membership.save
  	end
  	redirect_to current_user
  end
end
