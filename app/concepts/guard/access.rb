class Guard::Access < Guard::ApplicationGuard
  def call(ctx, request:, **kwargs)
    super(ctx, token: request.headers[JWTSessions.access_header]&.split(' ')&.last, request: request, **kwargs) do
      authorize_access_request!
    end
  end
end
