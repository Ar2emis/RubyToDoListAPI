class Session::Create < Session::Base
  step Policy::Guard(Guard::SignIn.new)
  step :model!
  step :tokens!

  def model!(ctx, current_user:, **)
    ctx[:model] = current_user
  end

  def tokens!(ctx, model:, **)
    payload = payload(model)
    tokens = JWTSessions::Session.new(payload: payload, refresh_payload: payload).login
    ctx[:tokens] = { JWTSessions.access_header => bearer(tokens[:access]),
                     JWTSessions.refresh_header => tokens[:refresh] }
  end
end
