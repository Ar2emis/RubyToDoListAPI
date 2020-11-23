module Api::V1
  module Task::Operation
    class Update < Trailblazer::Operation
      step Model(::Task, :find_by), fail_fast: true
      step Policy::Guard(Api::V1::Guard::Task::TaskGuard), fail_fast: true
      step Contract::Build(constant: Api::V1::Task::Contract::Update)
      step Contract::Validate()
      step Contract::Persist()
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
