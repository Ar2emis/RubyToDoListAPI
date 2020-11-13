class Api::V1::Project::Operation::Create < Trailblazer::Operation
  step Policy::Guard(Api::V1::Guard::Access.new), fail_fast: true
  step Model(Project, :new)
  step :assign_user
  step Contract::Build(constant: Api::V1::Project::Contract::Base)
  step Contract::Validate(key: :data)
  step Contract::Persist()
  step :result

  def assign_user(_, model:, current_user:, **)
    model.user = current_user
  end

  def result(ctx, model:, **)
    ctx[:result] = model
  end
end
