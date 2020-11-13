class Api::V1::Task::Contract::Create < ApplicationContract
  property :name

  validation do
    params do
      required(:name).filled(:string)
    end
  end
end
