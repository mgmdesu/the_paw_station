class PostComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post_dog
  
  validates :dog_comment, presence: true
  
end
