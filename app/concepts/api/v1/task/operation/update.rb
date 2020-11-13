class Api::V1::Task::Operation::Update < Trailblazer::Operation
  step Policy::Guard(Api::V1::Guard::Access.new), fail_fast: true
  step Policy::Guard(Api::V1::Guard::TaskExists.new, name: :existance), fail_fast: true
  step Model(Task, :find_by)
  step Contract::Build(constant: Api::V1::Task::Contract::Update)
  step Contract::Validate(key: :data)
  step Contract::Persist()
  step :result

  def result(ctx, model:, **)
    ctx[:result] = model
  end
end
