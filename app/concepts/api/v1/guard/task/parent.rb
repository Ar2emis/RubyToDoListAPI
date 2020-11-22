module Api::V1
  module Guard::Task
    class Parent
      def self.call(_, current_user:, params:, **)
        current_user.tasks.exists?(params[:task_id])
      end
    end
  end
end
