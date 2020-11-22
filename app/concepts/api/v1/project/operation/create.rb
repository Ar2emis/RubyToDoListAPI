module Api::V1
  module Project::Operation
    class Create < Trailblazer::Operation
      step Model(::Project, :new), fail_fast: true
      step Contract::Build(constant: Api::V1::Project::Contract::Base)
      step Contract::Validate()
      step Contract::Persist()
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
