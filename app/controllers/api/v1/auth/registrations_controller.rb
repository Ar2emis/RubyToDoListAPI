class Api::V1::Auth::RegistrationsController < Api::V1::Auth::AuthController
  def create
    endpoint operation: User::Create, options: options, before_response: before_response,
             renderer_options: { serializer: NewUserSerializer, status: :created }
  end
end
