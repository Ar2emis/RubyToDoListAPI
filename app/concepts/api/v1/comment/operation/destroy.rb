module Api::V1
  module Comment::Operation
    class Destroy < Trailblazer::Operation
      step Model(::Comment, :find_by), fail_fast: true
      step Policy::Guard(Api::V1::Guard::Comment::CommentGuard), fail_fast: true
      step :destroy

      def destroy(_, model:, **)
        model.destroy
      end
    end
  end
end
