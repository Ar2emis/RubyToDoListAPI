class Task::Index < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!

  def model!(ctx, current_user:, params:, **)
    ctx[:model] = current_user.projects.find_by(id: params[:project_id])&.tasks
  end
end
