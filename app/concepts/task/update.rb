class Task::Update < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!
  step Contract::Build(constant: Task::Contracts::Update)
  step Contract::Validate(key: :data)
  step Contract::Persist()

  def model!(ctx, params:, current_user:, **)
    ctx[:model] = current_user.tasks.find_by(id: params[:id])
  end
end
