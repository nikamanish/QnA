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
  		redirect_to @user
  	else
  		render "new"
  	end
  end

  def show
  end

  private
  	def group_params
  		params.require(:group).permit(:name)
  	end
end
