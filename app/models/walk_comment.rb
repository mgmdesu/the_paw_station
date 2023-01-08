class WalkComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :walk
  
  validates :walk_comment, presence: true
  
end
