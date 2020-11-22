module Api::V1
  module User::Operation
    class Create < Trailblazer::Operation
      step Model(::User, :new)
      step Contract::Build(constant: Api::V1::User::Contract::Create)
      step Contract::Validate()
      step Contract::Persist()
      step :generate_tokens
      step :result

      def generate_tokens(ctx, params:, **)
        result = Api::V1::Session::Operation::Create.call(params: params)
        ctx[:headers] = result[:headers]
      end

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
