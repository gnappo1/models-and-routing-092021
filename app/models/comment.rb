class Comment < ApplicationRecord
  belongs_to :post #will automatically validate post_id existance
  validates :rating, :content, presence: true
end
