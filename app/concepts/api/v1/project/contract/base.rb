class Api::V1::Project::Contract::Base < ApplicationContract
  delegate :user_id, to: :model
  property :name
  property :user_id, virtual: true

  validation do
    config.messages.backend = :i18n
    config.messages.namespace = :project

    params do
      required(:name).filled(:string)
      required(:user_id).filled
    end

    rule(:name, :user_id) do
      key.failure(:exists?) if Project.exists?(user_id: values[:user_id], name: values[:name])
    end
  end
end
