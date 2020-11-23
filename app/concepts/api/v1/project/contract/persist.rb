module Api::V1
  module Project::Contract
    class Persist < ApplicationContract
      property :name
      property :user

      validation do
        config.messages.backend = :i18n
        config.messages.namespace = :project

        params do
          required(:name).filled(:string)
          required(:user)
        end

        rule(:name, :user) do
          key.failure(:exists?) if ::Project.exists?(user: values[:user], name: values[:name])
        end
      end
    end
  end
end
