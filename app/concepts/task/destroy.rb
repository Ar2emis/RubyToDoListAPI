class Task::Destroy < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!
  step :destroy!
  step :reprioritate!

  def model!(ctx, params:, current_user:, **)
    ctx[:model] = current_user.tasks.find_by(id: params[:id])
  end

  def destroy!(_, model:, **)
    model.destroy
  end

  def reprioritate!(ctx, model:, **)
    ctx[:model] = nil
    tasks = model.project.tasks.where(position: (model.position + 1..))
    tasks.each { |task| task.update(position: task.position.pred) }
  end
end
