module Api::V1
  module Comment::Operation
    class Create < Trailblazer::Operation
      step Model(::Comment, :new), fail_fast: true
      step Policy::Guard(Api::V1::Guard::Task::Parent), fail_fast: true
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
