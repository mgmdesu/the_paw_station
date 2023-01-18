class Admin::WalksController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @walks = Walk.page(params[:page]).per(18).reverse_order
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @walks = @walks.where(tag_id: params[:tag_id])
    end
  end

  def show
    @walk = Walk.find(params[:id])
  end
  
  def destroy
    @walk = Walk.find(params[:id])
    @walk.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to admin_walks_path
  end
  
end
