class Comment::Index < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!

  def model!(ctx, current_user:, params:, **)
    ctx[:model] = current_user.tasks.find_by(id: params[:task_id])&.comments
  end
end
