module Api::V1
  module User::Operation
    class Create < Trailblazer::Operation
      step Model(::User, :new)
      step Contract::Build(constant: Api::V1::User::Contract::Create)
      step Contract::Validate()
      step Contract::Persist()
      step Subprocess(Api::V1::Session::Operation::Create)
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
