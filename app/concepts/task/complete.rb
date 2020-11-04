class Task::Complete < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!
  step :complete!

  def model!(ctx, params:, current_user:, **)
    ctx[:model] = current_user.tasks.find_by(id: params[:task_id])
  end

  def complete!(_, model:, **)
    model.update(done: true)
  end
end
