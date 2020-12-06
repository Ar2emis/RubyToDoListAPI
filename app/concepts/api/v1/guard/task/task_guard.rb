module Api::V1
  module Guard::Task
    class TaskGuard
      def self.call(_, current_user:, model:, **)
        current_user.tasks.exists?(model.id)
      end
    end
  end
end
