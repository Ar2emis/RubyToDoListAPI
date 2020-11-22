module Api::V1
  module Task::Contract
    class Create < ApplicationContract
      property :name
      property :project_id

      validation do
        params do
          required(:name).filled(:string)
        end
      end
    end
  end
end
