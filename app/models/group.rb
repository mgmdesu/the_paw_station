class Group < ApplicationRecord
  
  belongs_to :owner, class_name: 'User'
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user
  has_many :group_comments, dependent: :destroy
  
  def is_owned_by?(user)
    owner.id == user.id
  end 
  
  def includes_user?(user)
    group_users.exists?(user_id: user.id)
  end 
  
  has_one_attached :group_image
  
  def get_group_image
    (group_image.attached?) ? group_image: 'no_image.png'
  end
  
  validates :group_name, length: { minimum: 1, maximum: 25 }
  validates :explanation, presence: true
  validates :event_date, presence: true
  validates :start_at, presence: true
  validates :location, presence: true
  
end
