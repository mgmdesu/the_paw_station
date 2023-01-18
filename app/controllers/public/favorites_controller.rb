class Public::FavoritesController < ApplicationController
  
  def create
    @post_dog = PostDog.find(params[:post_dog_id])
    favorite = current_user.favorites.new(post_dog_id: @post_dog.id)
    favorite.save
  end
  
  def destroy
    @post_dog = PostDog.find(params[:post_dog_id])
    favorite = current_user.favorites.find_by(post_dog_id: @post_dog.id)
    favorite.destroy
  end 
end
