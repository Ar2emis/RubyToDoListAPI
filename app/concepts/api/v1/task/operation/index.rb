module Api::V1
  module Task::Operation
    class Index < Trailblazer::Operation
      step ::Macro::FindBy(::Project, parameter: :project_id), fail_fast: true
      step Policy::Guard(Api::V1::Guard::Project::ProjectGuard), fail_fast: true
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model.tasks
      end
    end
  end
end
