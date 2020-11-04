class Session::Base < Trailblazer::Operation
  private

  def bearer(token)
    "Bearer #{token}"
  end

  def payload(user)
    { user_id: user.id }
  end
end
