module Api::V1
  module Guard::Comment
    class CommentGuard
      def self.call(_, current_user:, model:, **)
        current_user.comments.exists?(model.id)
      end
    end
  end
end
