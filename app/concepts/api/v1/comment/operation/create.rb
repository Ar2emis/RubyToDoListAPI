class Api::V1::Comment::Operation::Create < Trailblazer::Operation
  step Policy::Guard(Api::V1::Guard::Access.new), fail_fast: true
  step Policy::Guard(Api::V1::Guard::TaskExists.new, name: :existance), fail_fast: true
  step Model(Comment, :new)
  step :assign_task
  step Contract::Build(constant: Api::V1::Comment::Contract::Create)
  step Contract::Validate(key: :data)
  step Contract::Persist()
  step :result

  def assign_task(_, model:, params:, **)
    model.task_id = params[:task_id]
  end

  def result(ctx, model:, **)
    ctx[:result] = model
  end
end
