class Public::BookmarksController < ApplicationController

  def create
    @walk = Walk.find(params[:walk_id])
    bookmark = current_user.bookmarks.new(walk_id: @walk.id)
    bookmark.save
  end 
  
  def destroy
    @walk = Walk.find(params[:walk_id])
    bookmark = current_user.bookmarks.find_by(walk_id: @walk.id)
    bookmark.destroy
  end
end
