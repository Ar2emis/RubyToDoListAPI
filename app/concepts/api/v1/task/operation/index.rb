class Api::V1::Task::Operation::Index < Trailblazer::Operation
  step Policy::Guard(Api::V1::Guard::Access.new), fail_fast: true
  step Policy::Guard(Api::V1::Guard::ProjectExists.new, name: :existance), fail_fast: true
  step :model
  step :result

  def model(ctx, params:, **)
    ctx[:model] = Project.find_by(id: params[:project_id])
  end

  def result(ctx, model:, **)
    ctx[:result] = model.tasks
  end
end
