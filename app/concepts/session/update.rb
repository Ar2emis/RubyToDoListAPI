class Session::Update < Session::Base
  step Policy::Guard(Guard::Refresh.new)
  step :update_access_token!

  def update_access_token!(ctx, current_user:, request:, **)
    refresh_token = request.headers[JWTSessions.refresh_header]
    tokens = JWTSessions::Session.new(payload: payload(current_user)).refresh(refresh_token)
    ctx[:tokens] = build_headers(**tokens.slice(:access))
  end
end
