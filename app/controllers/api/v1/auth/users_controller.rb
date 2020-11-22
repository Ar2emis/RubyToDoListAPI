module Api::V1
  module Auth
    class UsersController < Api::V1::Auth::AuthController
      def create
        endpoint operation: Api::V1::User::Operation::Create, before_response: before_response,
                 renderer_options: { serializer: NewUserSerializer, status: :created }
      end
    end
  end
end
