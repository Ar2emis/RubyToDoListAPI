module Api::V1
  module User::Contract
    class Create < ApplicationContract
      property :username
      property :password
      property :password_confirmation, virtual: true

      PASSWORD_REGEX = /\A[\w\d]+\z/.freeze
      PASSWORD_MIN_LENGTH = 8
      USERNAME_LENGTH = (3..50).freeze

      validation do
        config.messages.backend = :i18n
        config.messages.namespace = :user

        params do
          required(:username).filled(:string, size?: USERNAME_LENGTH)
          required(:password).filled(:string, min_size?: PASSWORD_MIN_LENGTH, format?: PASSWORD_REGEX)
          required(:password_confirmation).filled(:string)
        end

        rule(:password_confirmation, :password) do
          key.failure(:match?) if values[:password_confirmation] != values[:password]
        end

        rule(:username) do
          key.failure(:exists?) if ::User.exists?(username: value)
        end
      end
    end
  end
end
