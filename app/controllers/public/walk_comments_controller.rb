class Public::WalkCommentsController < ApplicationController
  
  def create
    @walk = Walk.find(params[:walk_id])
    @walk_comment = WalkComment.new(walk_comment_params)
    @walk_comment.walk_id = @walk.id
    @walk_comment.user_id = current_user.id
    @walk_comment.save
    @walk_comment = WalkComment.new
  end 
  
  def destroy
    @walk = Walk.find(params[:walk_id])
    @walk_comment = WalkComment.find(params[:id])
    @walk_comment.destroy
    @walk_comment = WalkComment.new
  end 
  
  private
  
  def walk_comment_params
    params.require(:walk_comment).permit(:walk_comment)
  end
end
