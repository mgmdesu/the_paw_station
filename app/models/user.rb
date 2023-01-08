class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  
  def get_profile_image
    (profile_image.attached?) ? profile_image: 'no_image.png'
  end

  #散歩関連
  has_many :walks, dependent: :destroy
  has_many :walk_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  #愛犬投稿関連
  has_many :post_dogs, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  #グループ
  has_many :group_users
  has_many :groups, through: :group_users
  
  #フォロー機能
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  
  validates :name, presence: true
  validates :is_deleted, presence: true
  
end