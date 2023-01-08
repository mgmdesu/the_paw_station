class Group < ApplicationRecord
  
  has_many :group_users
  has_many :users, through: :group_users
  
  has_one_attached :group_image
  
  def get_group_image
    (group_image.attached?) ? group_image: 'no_image.png'
  end
  
  validates :owner_id, presence: true
  validates :group_name, presence: true
  validates :explanation, presence: true
  validates :occasion, presence: true
  validates :location, presence: true
  
end
