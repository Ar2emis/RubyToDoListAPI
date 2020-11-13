class Api::V1::Auth::SessionsController < Api::V1::Auth::AuthController
  def create
    endpoint operation: Api::V1::Session::Operation::Create, options: options, before_response: before_response,
             renderer_options: { serializer: UserSerializer, status: :ok }
  end

  def update
    endpoint operation: Api::V1::Session::Operation::Update, options: options, before_response: before_response,
             renderer_options: { serializer: UserSerializer, status: :created }
  end

  def destroy
    endpoint operation: Api::V1::Session::Operation::Destroy, options: options, renderer_options: { status: :ok },
             different_handler: destroy_handler
  end
end
