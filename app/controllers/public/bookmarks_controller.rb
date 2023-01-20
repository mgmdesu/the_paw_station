class Public::BookmarksController < ApplicationController

  #ブックマークする/非同期通信化
  def create
    @walk = Walk.find(params[:walk_id])
    bookmark = current_user.bookmarks.new(walk_id: @walk.id)
    bookmark.save
  end 
  
  #ブックマーク取り消し/非同期通信化
  def destroy
    @walk = Walk.find(params[:walk_id])
    bookmark = current_user.bookmarks.find_by(walk_id: @walk.id)
    bookmark.destroy
  end
end
