class Public::PostCommentsController < ApplicationController
  
  def create
    post_dog = PostDog.find(params[:post_dog_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_dog_id = post_dog.id
    comment.save
    redirect_to post_dog_path(post_dog.id)
  end 
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_dog_path(params[:post_dog_id])
  end 
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:dog_comment)
  end 
end
