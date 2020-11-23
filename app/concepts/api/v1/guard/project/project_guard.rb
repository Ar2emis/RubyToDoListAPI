module Api::V1
  module Guard::Project
    class ProjectGuard
      def self.call(_, current_user:, model:, **)
        current_user.projects.exists?(model.id)
      end
    end
  end
end
