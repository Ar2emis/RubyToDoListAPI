module Api::V1
  module Comment::Contract
    class Create < ApplicationContract
      property :body
      property :image
      property :task_id

      validation do
        config.messages.backend = :i18n
        config.messages.namespace = :comment

        params do
          required(:body).filled(:string, size?: ::Constants::BODY_SIZE)
          required(:image).maybe(:filled?)
        end

        rule(:image) do
          next unless value

          attacher = ImageUploader::Attacher.new
          attacher.assign(value)
          attacher.errors.each { |error| key.failure(error) }
        rescue JSON::ParserError
          key.failure(:invalid?)
        end
      end
    end
  end
end
