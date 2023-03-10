class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      flash[:notice] = "オフ会を作成しました"
      redirect_to groups_path(@group.id)
    else
      render :new
    end 
  end 

  def index
    @groups = Group.page(params[:page]).per(10).reverse_order
  end

  def show
    @group = Group.find(params[:id])
    @group_comment = GroupComment.new
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "内容を変更しました"
      redirect_to groups_path
    else
      render :edit
    end
  end 

  private
  
  def group_params
    params.require(:group).permit(:group_name, :explanation, :event_date, :start_at, :location, :group_image, :is_deleted)
  end 
  
  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
end
