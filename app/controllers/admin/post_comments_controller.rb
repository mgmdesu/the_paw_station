class Admin::PostCommentsController < ApplicationController
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_post_dog_path(params[:post_dog_id])
  end 

end
