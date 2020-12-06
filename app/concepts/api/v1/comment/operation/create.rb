module Api::V1
  module Comment::Operation
    class Create < Trailblazer::Operation
      step ::Macro::FindBy(::Task, parameter: :task_id, model: :task), fail_fast: true
      step ::Macro::Guard(Api::V1::Guard::Task::TaskGuard, model: :task), fail_fast: true
      step Model(::Comment, :new), fail_fast: true
      step Contract::Build(constant: Api::V1::Comment::Contract::Create)
      step Contract::Validate()
      step Contract::Persist()
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
