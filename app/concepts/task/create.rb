class Task::Create < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!
  step Contract::Build(constant: Task::Contracts::Create)
  step Contract::Validate(key: :data)
  step Contract::Persist()

  def model!(ctx, current_user:, params:, **)
    project = current_user.projects.find_by(id: params[:project_id])
    ctx[:model] = project.tasks.build(position: project.tasks.count) if project
  end
end
