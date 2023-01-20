class PostDog < ApplicationRecord
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_one_attached :post_dog_image
  
  def get_post_dog_image
    (post_dog_image.attached?) ? post_dog_image: 'no_image.png'
  end
  
  #favorites存在有無のメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  validates :body, length: { minimum: 1, maximum: 300 }
  validates :post_dog_image, presence: true
  
end
