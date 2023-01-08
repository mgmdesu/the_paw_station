class Tag < ApplicationRecord
  
  has_many :post_tags, dependent: :destroy
  has_many :walks, through: :post_tags
  
  validates :prefecture, presence: true
  
end
