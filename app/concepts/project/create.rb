class Project::Create < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!
  step Contract::Build(constant: Project::Contracts::Base)
  step Contract::Validate(key: :data)
  step Contract::Persist()

  def model!(ctx, current_user:, **)
    ctx[:model] = current_user.projects.build
  end
end
