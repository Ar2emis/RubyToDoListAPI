module Api::V1
  module Task::Operation
    class Index < Trailblazer::Operation
      step Policy::Guard(Api::V1::Guard::Project::Parent), fail_fast: true
      step Model(::Project, :find, :project_id), fail_fast: true
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model.tasks
      end
    end
  end
end
