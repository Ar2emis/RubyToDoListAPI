class Api::V1::Comment::Operation::Destroy < Trailblazer::Operation
  step Policy::Guard(Api::V1::Guard::Access.new), fail_fast: true
  step Policy::Guard(Api::V1::Guard::CommentExists.new, name: :existance), fail_fast: true
  step Model(Comment, :find_by)
  step :destroy

  def destroy(_, model:, **)
    model.destroy
  end
end
