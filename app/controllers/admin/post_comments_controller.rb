class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @post_dog = PostDog.find(params[:post_dog_id])
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    # PostComment.find(params[:id]).destroy
    # redirect_to admin_post_dog_path(params[:post_dog_id])
  end
end
