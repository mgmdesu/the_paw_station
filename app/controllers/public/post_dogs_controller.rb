class Public::PostDogsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def new
    @post_dog = PostDog.new
  end
  
  def create
    @post_dog = PostDog.new(post_dog_params)
    @post_dog.user_id = current_user.id
    if @post_dog.save
      flash[:notice] = "投稿されました"
      redirect_to post_dog_path(@post_dog.id)
    else
      render :new
    end 
  end 

  def index
    @post_dogs = PostDog.all
  end

  def show
    @post_dog = PostDog.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post_dog = PostDog.find(params[:id])
  end
  
  def update
    @post_dog = PostDog.find(params[:id])
    if @post_dog.update(post_dog_params)
      flash[:notice] = "内容を編集しました"
      redirect_to post_dog_path(@post_dog.id)
    else
      render :edit
    end 
  end
  
  def destroy
    @post_dog = PostDog.find(params[:id])
    @post_dog.destroy
    flash[:alert] = "投稿を削除しました"
    redirect_to post_dogs_path
  end 
  
  private
  
  def post_dog_params
    params.require(:post_dog).permit(:body, :post_dog_image)
  end 
  
  def ensure_correct_user
    @post_dog = PostDog.find(params[:id])
    unless @post_dog.user == current_user
      redirect_to post_dogs_path
    end 
  end 
end
