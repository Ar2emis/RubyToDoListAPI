class Api::V1::Project::Operation::Index < Trailblazer::Operation
  step Policy::Guard(Api::V1::Guard::Access.new), fail_fast: true
  step :result

  def result(ctx, current_user:, **)
    ctx[:result] = current_user.projects
  end
end
