class Admin::WalkCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @walk = Walk.find(params[:walk_id])
    @walk_comment = WalkComment.find(params[:id])
    @walk_comment.destroy
  end 
end
