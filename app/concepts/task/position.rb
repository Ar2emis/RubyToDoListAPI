class Task::Position < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!
  step Contract::Build(constant: Task::Contracts::Position)
  step Contract::Validate(key: :data)
  step :reprioritate!

  def model!(ctx, params:, current_user:, **)
    ctx[:model] = current_user.tasks.find_by(id: params[:task_id])
  end

  def reprioritate!(_, model:, params:, **)
    new_position = params[:data][:position]
    Task.find_by(project_id: model.project_id, position: new_position).update(position: model.position)
    model.update(position: new_position)
  end
end
