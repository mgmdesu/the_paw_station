class Public::GroupUsersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    group_user = current_user.group_users.new(group_id: params[:group_id])
    group_user.save
    @group = Group.find(params[:group_id])
  end
  
  def destroy
    group_user = current_user.group_users.find_by(group_id: params[:group_id])
    group_user.destroy
    @group = Group.find(params[:group_id])
  end
end
