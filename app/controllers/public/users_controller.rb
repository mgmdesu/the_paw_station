class Public::UsersController < ApplicationController
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def unsubscribe
  end
  
  def withdraw
    user = current_user
    user.update(is_deleted: true)
    reset_session
    flash[:alert] = "退会のお手続きが完了しました"
    redirect_to root_path
  end
  
end
