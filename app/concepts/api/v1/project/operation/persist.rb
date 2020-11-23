module Api::V1
  module Project::Operation
    class Persist < Trailblazer::Operation
      step Contract::Build(constant: Api::V1::Project::Contract::Persist)
      step Contract::Validate()
      step Contract::Persist()
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
