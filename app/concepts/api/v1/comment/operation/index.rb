module Api::V1
  module Comment::Operation
    class Index < Trailblazer::Operation
      step Policy::Guard(Api::V1::Guard::Task::Parent), fail_fast: true
      step Model(::Task, :find, :task_id), fail_fast: true
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model.comments
      end
    end
  end
end
