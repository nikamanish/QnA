class GroupsController < ApplicationController
  def new
  	@group = Group.new
  	@user = current_user
  end

  def create
  	@group = Group.new(group_params)
  	@user = current_user
  	if @group.save
  		flash[:success] = "New group #{@group.name} successfully created"
      membership = Membership.new(user_id: @user.id, group_id: @group.id, admin: true)
      membership.save
      session[:group_id] = @group.id
  		redirect_to @user
  	else
  		render "new"
  	end
  end

  def index
    
  end

  def show
    
  end

  private
  	def group_params
  		params.require(:group).permit(:name)
  	end
end
