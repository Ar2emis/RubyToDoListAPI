module Api::V1
  module Guard::Task
    class Base
      def self.call(_, current_user:, model:, **)
        current_user.tasks.include?(model)
      end
    end
  end
end
