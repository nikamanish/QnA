class CommentsController < ApplicationController
  def new
  end

  def create
  	comment = Comment.new(content: params[:comment][:comment], post_id: params[:comment][:post_id], user_id: current_user.id)
  	comment.save
  	group = Group.find_by(id: (params[:comment][:group_id]).to_i)
	redirect_to group  	
  end
end
