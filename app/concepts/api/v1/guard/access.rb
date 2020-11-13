class Api::V1::Guard::Access < Api::V1::Guard::ApplicationGuard
  def call(ctx, request:, **kwargs)
    super(ctx, token: access_token(request), request: request, **kwargs) do
      authorize_access_request!
    end
  end

  private

  def access_token(request)
    request.headers[JWTSessions.access_header]&.split(' ')&.last
  end
end
