module Api::V1
  module Project::Operation
    class Show < Trailblazer::Operation
      step Model(::Project, :find_by), fail_fast: true
      step Policy::Guard(Api::V1::Guard::Project::ProjectGuard), fail_fast: true
      step :result

      def result(ctx, model:, **)
        ctx[:result] = model
      end
    end
  end
end
