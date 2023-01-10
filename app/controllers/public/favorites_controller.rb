class Public::FavoritesController < ApplicationController
  
  def create
    post_dog = PostDog.find(params[:post_dog_id])
    favorite = current_user.favorites.new(post_dog_id: post_dog.id)
    favorite.save
    redirect_to post_dog_path(post_dog.id)
  end
  
  def destroy
    post_dog = PostDog.find(params[:post_dog_id])
    favorite = current_user.favorites.find_by(post_dog_id: post_dog.id)
    favorite.destroy
    redirect_to post_dog_path(post_dog.id)
  end 
end
