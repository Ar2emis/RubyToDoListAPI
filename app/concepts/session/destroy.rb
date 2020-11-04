class Session::Destroy < Session::Base
  step Policy::Guard(Guard::Refresh.new)
  step :flush_session!
  step :response!

  def flush_session!(_, request:, **)
    refresh_token = request.headers[JWTSessions.refresh_header]
    JWTSessions::Session.new.flush_by_token(refresh_token)
  end

  def response!(ctx, **)
    ctx[:model] = { success: true }
  end
end
