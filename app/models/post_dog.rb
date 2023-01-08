class PostDog < ApplicationRecord
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  #favorites存在有無のメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  validates :body, presence: true
  
end
