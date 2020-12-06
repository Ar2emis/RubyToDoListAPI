module Api::V1
  module Comment::Operation
    class Index < Trailblazer::Operation
      step ::Macro::FindBy(::Task, parameter: :task_id), fail_fast: true
      step Policy::Guard(Api::V1::Guard::Task::TaskGuard), fail_fast: true
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model.comments
      end
    end
  end
end
