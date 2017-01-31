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
  	user = User.find_by(id: params[:invite][:id])
  	
  end

  def show
  end
end
