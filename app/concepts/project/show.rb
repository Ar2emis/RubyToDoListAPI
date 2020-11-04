class Project::Show < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!

  def model!(ctx, params:, current_user:, **)
    ctx[:model] = current_user.projects.find_by(id: params[:id])
  end
end
