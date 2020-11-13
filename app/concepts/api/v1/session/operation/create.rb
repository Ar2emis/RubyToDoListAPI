class Api::V1::Session::Operation::Create < Api::V1::Session::Operation::Base
  step Policy::Guard(Api::V1::Guard::SignIn.new), fail_fast: true
  step :generate_tokens
  step :generate_headers
  step :result

  def result(ctx, current_user:, **)
    ctx[:result] = current_user
  end

  def generate_tokens(ctx, current_user:, **)
    payload = payload(current_user)
    ctx[:tokens] = JWTSessions::Session.new(payload: payload, refresh_payload: payload).login
  end

  def generate_headers(ctx, tokens:, **)
    ctx[:headers] = build_headers(**tokens.slice(:access, :refresh))
  end
end
