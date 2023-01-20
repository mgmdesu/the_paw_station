class Public::FavoritesController < ApplicationController

  #いいねする/非同期通信化
  def create
    @post_dog = PostDog.find(params[:post_dog_id])
    favorite = current_user.favorites.new(post_dog_id: @post_dog.id)
    favorite.save
  end
  
  #いいね取り消し/非同期通信化
  def destroy
    @post_dog = PostDog.find(params[:post_dog_id])
    favorite = current_user.favorites.find_by(post_dog_id: @post_dog.id)
    favorite.destroy
  end 
end
