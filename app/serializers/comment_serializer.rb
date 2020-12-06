class CommentSerializer < BaseSerializer
  attribute :body
  attribute :image do |object|
    object.image&.url
  end
end
