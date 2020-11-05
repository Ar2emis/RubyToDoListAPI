class Guard::SignIn < Guard::ApplicationGuard
  def call(ctx, params:, **)
    ctx[:current_user] = User.find_by(username: params[:username])&.authenticate(params[:password])
  end
end
