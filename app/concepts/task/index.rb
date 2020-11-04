class Task::Index < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!

  def model!(options, current_user:, params:, **)
    options[:model] = current_user.projects.find_by(id: params[:project_id])&.tasks
  end
end
