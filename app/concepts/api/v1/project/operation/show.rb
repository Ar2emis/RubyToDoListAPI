class Api::V1::Project::Operation::Show < Trailblazer::Operation
  step Policy::Guard(Api::V1::Guard::Access.new), fail_fast: true
  step Policy::Guard(Api::V1::Guard::ProjectExists.new, name: :existance), fail_fast: true
  step Model(Project, :find_by)
  step :result

  def result(ctx, model:, **)
    ctx[:result] = model
  end
end
