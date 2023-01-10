class Public::WalksController < ApplicationController
  
  def new
    @walk = Walk.new
    @user = current_user
  end
  
  def create
    @walk = Walk.new(walk_params)
    @walk.user_id = current_user.id
    if @walk.save
      flash[:notice] = "投稿されました"
      redirect_to walk_path(@walk.id)
    else
      render :new
    end
  end 

  def index
    @walks = Walk.all
    @user = current_user
  end

  def show
    @walk = Walk.find(params[:id])
    @user = @walk.user
    @walk_comment = WalkComment.new
  end

  def edit
    @walk = Walk.find(params[:id])
    @user = current_user
  end
  
  def update
    @walk = Walk.find(params[:id])
    if @walk.update(walk_params)
      flash[:notice] = "内容を編集しました"
      redirect_to walk_path(@walk.id)
    else
      render :edit
    end
  end
  
  def destroy
    @walk = Walk.find(params[:id])
    @walk.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to walks_path
  end
  
  private
  
  def walk_params
    params.require(:walk).permit(:title, :opinion, :dogrun_name, :facility, :size, :walk_image)
  end 
  
end
