class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @groups = Group.all
  end
  
  def show
    @group = Group.find(params[:id])
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "内容を変更しました"
      redirect_to admin_groups_path
    else
      render :edit
    end
  end 
  
  private
  
  def group_params
    params.require(:group).permit(:group_name, :explanation, :event_date, :start_at, :location, :group_image, :is_deleted)
  end 
end
