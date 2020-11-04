class Guard::ApplicationGuard
  include JWTSessions::RailsAuthorization

  def call(ctx, token:, request:, **)
    @request = request
    yield
    payload = JWTSessions::Token.decode!(token).first
    ctx[:current_user] = User.find_by(id: payload['user_id'])
  rescue JWTSessions::Errors::Unauthorized
    false
  end

  private

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
