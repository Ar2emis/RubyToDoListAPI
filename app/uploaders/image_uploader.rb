class ImageUploader < Shrine
  IMAGE_SIZE_RANGE = (1..10.megabytes).freeze
  IMAGE_MIME_TYPES = %w[image/jpeg image/png].freeze
  IMAGE_EXTENTIONS = %w[jpg jpeg png].freeze

  Attacher.validate do
    validate_size      IMAGE_SIZE_RANGE
    validate_mime_type IMAGE_MIME_TYPES
    validate_extension IMAGE_EXTENTIONS
  end
end
