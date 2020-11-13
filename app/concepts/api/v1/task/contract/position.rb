class Api::V1::Task::Contract::Position < ApplicationContract
  POSITION_RANGE = (0..1).freeze

  property :position

  validation do
    config.messages.backend = :i18n
    config.messages.namespace = :task

    params do
      required(:position).filled(:int?, included_in?: POSITION_RANGE)
    end
  end
end
