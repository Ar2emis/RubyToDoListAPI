class Api::V1::Task::Operation::Complete < Trailblazer::Operation
  step Policy::Guard(Api::V1::Guard::Access.new), fail_fast: true
  step Policy::Guard(Api::V1::Guard::TaskExists.new, name: :existance), fail_fast: true
  step :model
  step :complete
  step :result

  def model(ctx, params:, **)
    ctx[:model] = Task.find_by(id: params[:task_id])
  end

  def complete(_, model:, **)
    model.update(done: true)
  end

  def result(ctx, model:, **)
    ctx[:result] = model
  end
end
