class Public::GroupCommentsController < ApplicationController
  
  def create
    @group = Group.find(params[:group_id])
    @group_comment = GroupComment.new(group_comment_params)
    @group_comment.group_id = @group.id
    @group_comment.user_id = current_user.id
    @group_comment.save
  end 
  
  def destroy
    @group = Group.find(params[:group_id])
    @group_comment = GroupComment.find(params[:id])
    @group_comment.destroy
  end
  
  private
  
  def group_comment_params
    params.require(:group_comment).permit(:group_comment)
  end
end
