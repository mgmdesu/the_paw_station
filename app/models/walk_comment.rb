class WalkComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :walk
  
  validates :walk_comment, length: { minimum: 1, maximum: 300 }
  
end
