class Api::V1::Session::Operation::Destroy < Api::V1::Session::Operation::Base
  step Policy::Guard(Api::V1::Guard::Refresh.new), fail_fast: true
  step :flush_session
  step :result

  def flush_session(_, request:, **)
    refresh_token = request.headers[JWTSessions.refresh_header]
    JWTSessions::Session.new.flush_by_token(refresh_token)
  end

  def result(ctx, **)
    ctx[:result] = { success: true }
  end
end
