class Api::V1::Guard::CommentExists < Api::V1::Guard::ApplicationGuard
  def call(_, current_user:, params:, **)
    current_user.comments.exists?(params[:id])
  end
end
