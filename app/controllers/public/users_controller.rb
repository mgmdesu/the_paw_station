class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @post_dogs = @user.post_dogs
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "登録情報を変更しました"
      redirect_to user_path(@user)
    else
      flash[:alert] = "入力内容をお確かめください"
      render :edit
    end 
  end 

  def unsubscribe
  end
  
  def withdraw
    user = User.find(params[:id])
    user.update(is_deleted: true)
    reset_session
    flash[:alert] = "退会のお手続きが完了しました"
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(@user)
    end 
  end
  
end
