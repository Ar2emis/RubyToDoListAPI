class Comment::Destroy < Trailblazer::Operation
  step Policy::Guard(Guard::Access.new)
  step :model!
  step :destroy!

  def model!(ctx, params:, current_user:, **)
    ctx[:model] = current_user.comments.find_by(id: params[:id])
  end

  def destroy!(ctx, model:, **)
    ctx[:model] = nil
    model.destroy
  end
end
