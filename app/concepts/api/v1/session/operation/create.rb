module Api::V1
  module Session::Operation
    class Create < Trailblazer::Operation
      step Model(::User, :find_by, :username), fail_fast: true
      step Contract::Build(constant: Api::V1::User::Contract::SignIn)
      step Contract::Validate()
      step :generate_headers
      step :result

      def generate_headers(ctx, model:, **)
        ctx[:headers] = Api::V1::GenerateHeadersService.call(user: model)
      end

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
