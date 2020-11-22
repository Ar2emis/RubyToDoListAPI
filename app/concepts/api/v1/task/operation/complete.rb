module Api::V1
  module Task::Operation
    class Complete < Trailblazer::Operation
      step Policy::Guard(Api::V1::Guard::Task::Parent), fail_fast: true
      step Model(::Task, :find, :task_id), fail_fast: true
      step :complete
      step :result

      def complete(_, model:, **)
        model.update(done: true)
      end

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
