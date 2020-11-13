class Api::V1::Task::Operation::Position < Trailblazer::Operation
  UP = 0
  DOWN = 1

  step Policy::Guard(Api::V1::Guard::Access.new), fail_fast: true
  step Policy::Guard(Api::V1::Guard::TaskExists.new, name: :existance), fail_fast: true
  step :model
  step Contract::Build(constant: Api::V1::Task::Contract::Position)
  step Contract::Validate(key: :data)
  step :reprioritate
  step :result

  def model(ctx, params:, **)
    ctx[:model] = Task.find_by(id: params[:task_id])
  end

  def reprioritate(_, model:, params:, **)
    case params[:data][:position].to_i
    when UP then model.move_higher
    when DOWN then model.move_lower
    end
    true
  end

  def result(ctx, model:, **)
    ctx[:result] = model
  end
end
