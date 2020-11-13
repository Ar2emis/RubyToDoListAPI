class Comment < ApplicationRecord
  validates :body, presence: true

  include ImageUploader::Attachment(:image)

  belongs_to :task
end
