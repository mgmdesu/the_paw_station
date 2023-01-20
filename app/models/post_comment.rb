class PostComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post_dog
  
  validates :dog_comment, length: { minimum: 1, maximum: 300 }
  
end
