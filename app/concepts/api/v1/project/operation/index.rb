module Api::V1
  module Project::Operation
    class Index < Trailblazer::Operation
      step :result

      def result(ctx, current_user:, **)
        ctx[:result] = current_user.projects
      end
    end
  end
end
