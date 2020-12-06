module Api::V1
  module User::Contract
    class SignIn < ApplicationContract
      delegate :authenticate, to: :model
      property :password
      property :password_match, virtual: true

      def password_match
        authenticate(password)
      end

      validation do
        config.messages.backend = :i18n
        config.messages.namespace = :user

        params do
          required(:password_match).filled
        end

        rule(:password_match) do
          key.failure(:match?) unless value
        end
      end
    end
  end
end
