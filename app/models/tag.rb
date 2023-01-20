class Tag < ApplicationRecord
  
  has_many :walks, dependent: :destroy
  
  validates :prefecture, presence: true
  
end
