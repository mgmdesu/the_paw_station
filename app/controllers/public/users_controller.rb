class Public::UsersController < ApplicationController
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "登録情報を変更しました"
      redirect_to users_path
    else
      flash[:alert] = "入力内容をお確かめください"
      render :edit
    end 
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
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
