module Api::V1
  module Task::Contract
    class Position < ApplicationContract
      POSITION_RANGE = %w[up down].freeze

      property :position

      validation do
        config.messages.backend = :i18n
        config.messages.namespace = :task

        params do
          required(:position).filled(:string, included_in?: POSITION_RANGE)
        end
      end
    end
  end
end
