module Api::V1
  module Task::Operation
    class Position < Trailblazer::Operation
      step Policy::Guard(Api::V1::Guard::Task::Parent), fail_fast: true
      step Model(::Task, :find, :task_id), fail_fast: true
      step Contract::Build(constant: Api::V1::Task::Contract::Position)
      step Contract::Validate()
      step :reprioritate
      step :result

      def reprioritate(_, model:, params:, **)
        Api::V1::Task::Service::Reprioritate.call(task: model, position: params[:position])
      end

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
