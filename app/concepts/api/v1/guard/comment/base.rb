module Api::V1
  module Guard::Comment
    class Base
      def self.call(_, current_user:, model:, **)
        current_user.comments.include?(model)
      end
    end
  end
end
