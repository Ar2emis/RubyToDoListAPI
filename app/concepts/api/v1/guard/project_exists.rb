class Api::V1::Guard::ProjectExists < Api::V1::Guard::ApplicationGuard
  def call(_, current_user:, params:, **)
    current_user.projects.exists?(params[:project_id] || params[:id])
  end
end
