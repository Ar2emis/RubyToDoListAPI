class Guard::SignIn < Guard::ApplicationGuard
  def call(options, params:, **)
    options[:current_user] = User.find_by(username: params[:username])&.authenticate(params[:password])
  end
end
