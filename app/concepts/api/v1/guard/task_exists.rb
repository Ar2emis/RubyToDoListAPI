class Api::V1::Guard::TaskExists < Api::V1::Guard::ApplicationGuard
  def call(_, current_user:, params:, **)
    current_user.tasks.exists?(params[:task_id] || params[:id])
  end
end
