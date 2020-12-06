module Api::V1
  module Task::Operation
    class Show < Trailblazer::Operation
      step Model(::Task, :find_by), fail_fast: true
      step Policy::Guard(Api::V1::Guard::Task::TaskGuard), fail_fast: true
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
