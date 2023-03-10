class Walk < ApplicationRecord
  
  belongs_to :user
  has_many :walk_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :tag
  
  has_one_attached :walk_image
  
  def get_walk_image
    (walk_image.attached?) ? walk_image: 'no_image.png'
  end
  
  #book_mark存在有無のメソッド
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
  
  enum facility: { outdoor: 0, indoor: 1, both: 2 }
  enum size: { small_dog: 0, medium_size_dog: 1, large_size_dog: 2 }
  
  validates :title, length: { minimum: 1, maximum: 20 }
  validates :opinion, length: { minimum: 1, maximum: 300 }
  validates :facility, presence: true
  validates :size, presence: true
  
end
