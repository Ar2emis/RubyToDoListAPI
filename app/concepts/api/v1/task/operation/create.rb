module Api::V1
  module Task::Operation
    class Create < Trailblazer::Operation
      step Model(::Task, :new), fail_fast: true
      step Policy::Guard(Api::V1::Guard::Project::Parent), fail_fast: true
      step Contract::Build(constant: Api::V1::Task::Contract::Create)
      step Contract::Validate()
      step Contract::Persist()
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
