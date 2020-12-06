module Api::V1
  class ReprioritateService < ApplicationService
    POSITION_ACTIONS = {
      up: ->(task) { task.move_higher },
      down: ->(task) { task.move_lower }
    }.freeze

    def call(task:, position:)
      POSITION_ACTIONS[position.to_sym].call(task)
    end
  end
end
