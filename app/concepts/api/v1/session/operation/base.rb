class Api::V1::Session::Operation::Base < Trailblazer::Operation
  private

  def payload(user)
    { user_id: user.id }
  end

  def build_headers(access: nil, refresh: nil)
    {
      JWTSessions.access_header => ("Bearer #{access}" if access),
      JWTSessions.refresh_header => refresh
    }
  end
end
