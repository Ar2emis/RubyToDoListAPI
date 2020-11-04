class Comment::Contracts::Create < ApplicationContract
  BODY_SIZE = (10..256).freeze

  property :body
  property :image

  validation do
    config.messages.backend = :i18n
    config.messages.namespace = :comment

    params do
      required(:body).filled(size?: BODY_SIZE)
      optional(:image).maybe(:filled?)
    end

    rule(:image) do
      continue unless key?

      attacher = ImageUploader::Attacher.new
      attacher.assign(value)
      attacher.errors.each { |error| key.failure(error) }
    rescue JSON::ParserError
      key.failure(:invalid?)
    end
  end
end
