class Tag < ApplicationRecord
  
  has_many :walks
  
  validates :prefecture, presence: true
  
end
