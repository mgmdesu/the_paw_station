class Public::PostDogsController < ApplicationController
  
  def new
    @post_dog = PostDog.new
  end
  
  def create
    @post_dog = PostDog.new(post_dog_params)
    @post_dog.user_id = current_user.id
    if @post_dog.save
      flash[:notice] = " 投稿されました"
      redirect_to post_dog_path(@post_dog.id)
    else
      render :new
    end 
  end 

  def index
    @post_dogs = PostDog.all
  end

  def show
  end

  def edit
  end
  
  private
  
  def post_dog_params
    params.require(:post_dog).permit(:body, :post_dog_image)
  end 
end
