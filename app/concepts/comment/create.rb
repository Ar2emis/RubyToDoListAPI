class Comment::Create < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!
  step Contract::Build(constant: Comment::Contracts::Create)
  step Contract::Validate(key: :data)
  step Contract::Persist()

  def model!(ctx, current_user:, params:, **)
    ctx[:model] = current_user.tasks.find_by(id: params[:task_id])&.comments&.build
  end
end
