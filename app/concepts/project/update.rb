class Project::Update < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!
  step Contract::Build(constant: Project::Contracts::Base)
  step Contract::Validate(key: :data)
  step Contract::Persist()

  def model!(ctx, params:, current_user:, **)
    ctx[:model] = current_user.projects.find_by(id: params[:id])
  end
end
