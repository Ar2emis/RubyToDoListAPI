module Api::V1
  module Guard::Project
    class Parent
      def self.call(_, current_user:, params:, **)
        current_user.projects.exists?(params[:project_id])
      end
    end
  end
end
