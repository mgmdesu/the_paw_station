class Admin::WalkCommentsController < ApplicationController
  
  def destroy
    WalkComment.find(params[:id]).destroy
    redirect_to admin_walk_path(params[:walk_id])
  end 
end
