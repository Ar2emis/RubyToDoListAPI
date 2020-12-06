class Comment < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :task
end
