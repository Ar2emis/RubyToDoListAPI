module Api::V1
  module Task::Service
    class Reprioritate
      UP = 'up'.freeze
      DOWN = 'down'.freeze

      def self.call(task:, position:)
        case position
        when UP then task.move_higher
        when DOWN then task.move_lower
        end
        true
      end
    end
  end
end
