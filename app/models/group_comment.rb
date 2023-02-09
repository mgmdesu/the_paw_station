class GroupComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :group
  
  validates :group_comment, length: { minimum: 1, maximum: 500 }
  
end
