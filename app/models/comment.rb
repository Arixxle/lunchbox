class Comment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 2 }
  belongs_to :user
  belongs_to :item
end
