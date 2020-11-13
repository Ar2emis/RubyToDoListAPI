class Api::V1::Task::Operation::Create < Trailblazer::Operation
  step Policy::Guard(Api::V1::Guard::Access.new), fail_fast: true
  step Policy::Guard(Api::V1::Guard::ProjectExists.new, name: :existance), fail_fast: true
  step Model(Task, :new)
  step :assign_project
  step :assign_position
  step Contract::Build(constant: Api::V1::Task::Contract::Create)
  step Contract::Validate(key: :data)
  step Contract::Persist()
  step :result

  def assign_project(_, model:, params:, **)
    model.project_id = params[:project_id]
  end

  def assign_position(_, model:, **)
    model.position = model.project.tasks.count
  end

  def result(ctx, model:, **)
    ctx[:result] = model
  end
end
