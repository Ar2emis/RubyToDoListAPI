class Api::V1::Guard::ApplicationGuard
  include JWTSessions::RailsAuthorization

  def call(ctx, token:, request:, **)
    @request = request
    yield
    ctx[:current_user] = current_user(token)
    true
  rescue JWTSessions::Errors::Unauthorized
    false
  end

  private

  def current_user(token)
    payload = JWTSessions::Token.decode!(token).first
    User.find_by(id: payload['user_id'])
  end

  def request_headers
    @request.headers
  end

  def request_cookies
    @request.cookies
  end

  def request_method
    @request.method
  end
end
