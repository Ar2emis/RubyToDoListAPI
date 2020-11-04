class Project::Index < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!

  def model!(ctx, current_user:, **)
    ctx[:model] = current_user.projects
  end
end
