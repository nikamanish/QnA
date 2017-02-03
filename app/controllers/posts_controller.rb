class PostsController < ApplicationController
  def new
  end

  def create
  	membership = Membership.where(group_id: params[:post][:group_id], user_id: current_user.id).first
  	post = Post.new(content: params[:post][:content], membership_id: membership.id, subject: params[:post][:subject])
  	post.save
  	group = Group.find(params[:post][:group_id])
  	redirect_to group_path(group)

  end

  def show
    
  end
end
