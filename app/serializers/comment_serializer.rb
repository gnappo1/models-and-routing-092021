class CommentSerializer# < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :content, :rating, :created_at#, :post
  belongs_to :post, serializer: PostSerializer

  attribute :rating do |object|
    "Rating is #{object.rating}/5"
  end

  # attribute :post do |object|
  #   PostSerializer.new(object.post)
  # end
end
