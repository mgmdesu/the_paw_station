class Admin::PostDogsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @post_dogs = PostDog.page(params[:page]).per(18).reverse_order
  end

  def show
    @post_dog = PostDog.find(params[:id])
  end
  
  def destroy
    @post_dog = PostDog.find(params[:id])
    @post_dog.destroy
    flash[:alert] = "投稿を削除しました"
    redirect_to admin_post_dogs_path
  end
end
