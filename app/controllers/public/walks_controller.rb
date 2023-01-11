class Public::WalksController < ApplicationController
  
  def new
    @walk = Walk.new
    @tags = Tag.all
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
  end

  def show
    @walk = Walk.find(params[:id])
    @walk_comment = WalkComment.new
  end

  def edit
    @walk = Walk.find(params[:id])
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
    params.require(:walk).permit(:title, :opinion, :dogrun_name, :facility, :size, :walk_image, :tag_id)
  end 
  
end
