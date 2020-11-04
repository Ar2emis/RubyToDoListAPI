class Guard::Refresh < Guard::ApplicationGuard
  def call(ctx, request:, **kwargs)
    super(ctx, token: request.headers[JWTSessions.refresh_header], request: request, **kwargs) do
      authorize_refresh_request!
    end
  end
end
