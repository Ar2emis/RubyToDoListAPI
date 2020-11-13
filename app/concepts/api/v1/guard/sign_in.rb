class Api::V1::Guard::SignIn < Api::V1::Guard::ApplicationGuard
  def call(ctx, params:, **)
    current_user(ctx, params)
    authenticate_user(ctx, params) ? true : false
  end

  private

  def current_user(ctx, params)
    ctx[:current_user] = User.find_by(username: params[:username])
  end

  def authenticate_user(ctx, params)
    ctx[:current_user]&.authenticate(params[:password])
  end
end
