module Api::V1
  module Guard::Project
    class Base
      def self.call(_, current_user:, model:, **)
        current_user.projects.include?(model)
      end
    end
  end
end
