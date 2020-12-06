module Api::V1
  module Auth
    class SessionsController < Api::V1::Auth::AuthController
      before_action :authorize_access_request!, only: %i[destroy]

      def create
        endpoint operation: Api::V1::Session::Operation::Create, before_response: before_response,
                 renderer_options: { serializer: UserSerializer, status: :ok }, different_cases: create_cases,
                 different_handler: create_handler
      end

      def destroy
        endpoint operation: Api::V1::Session::Operation::Destroy, options: { payload: payload },
                 different_handler: destroy_handler
      end

      private

      def create_cases
        { invalid: ->(result) { result.failure? } }
      end

      def create_handler
        { invalid: ->(_, **) { not_authorized } }
      end

      def destroy_handler
        { success: ->(_, **) { render json: { success: true }, status: :ok } }
      end
    end
  end
end
