class Api::V1::Session::Operation::Update < Api::V1::Session::Operation::Base
  step Policy::Guard(Api::V1::Guard::Refresh.new), fail_fast: true
  step :update_access_token
  step :assign_access_token
  step :result

  def update_access_token(ctx, current_user:, request:, **)
    refresh_token = request.headers[JWTSessions.refresh_header]
    payload = payload(current_user)
    ctx[:access_token] = JWTSessions::Session.new(payload: payload).refresh(refresh_token)[:access]
  end

  def assign_access_token(ctx, access_token:, **)
    ctx[:headers] = build_headers(access: access_token)
  end

  def result(ctx, current_user:, **)
    ctx[:result] = current_user
  end
end
