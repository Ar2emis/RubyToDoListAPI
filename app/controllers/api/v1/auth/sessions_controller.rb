class Api::V1::Auth::SessionsController < Api::V1::Auth::AuthController
  def create
    endpoint operation: Session::Create, options: options, before_response: before_response,
             renderer_options: { serializer: UserSerializer, status: :ok }
  end

  def update
    endpoint operation: Session::Update, options: options, before_response: before_response,
             renderer_options: { status: :created }
  end

  def destroy
    endpoint operation: Session::Destroy, options: options, renderer_options: { status: :ok }
  end
end
