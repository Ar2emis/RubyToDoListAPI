module Api::V1
  module Session::Operation
    class Create < Trailblazer::Operation
      step Model(::User, :find_by, :username), fail_fast: true
      step Contract::Build(constant: Api::V1::User::Contract::SignIn)
      step Contract::Validate()
      step :generate_tokens
      step :generate_headers
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model
      end

      def generate_tokens(ctx, model:, **)
        ctx[:tokens] = JWTSessions::Session.new(payload: payload(model), refresh_by_access_allowed: true).login
      end

      def generate_headers(ctx, tokens:, **)
        ctx[:headers] = { JWTSessions.access_header => "Bearer #{tokens[:access]}" }
      end

      private

      def payload(user)
        { user_id: user.id }
      end
    end
  end
end
