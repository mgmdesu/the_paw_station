class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  
  def get_profile_image
    (profile_image.attached?) ? profile_image: 'user_no_image.png'
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
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users, dependent: :destroy
  
  #フォロー機能
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  def follow(user)
    relationships.create(followed_id: user.id)
  end
  
  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  
  validates :name, length: { minimum: 2, maximum: 15 }, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  #退会済みのユーザーが同アカウントでログイン不可の制約
  def active_for_authentication?
    super && (is_deleted == false)
  end 
  
  #ゲストユーザーログイン時
  def self.guest
    find_or_create_by!(name: 'ゲストユーザー', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end

end