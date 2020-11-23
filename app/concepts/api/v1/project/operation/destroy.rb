module Api::V1
  module Project::Operation
    class Destroy < Trailblazer::Operation
      step Model(::Project, :find_by), fail_fast: true
      step Policy::Guard(Api::V1::Guard::Project::ProjectGuard), fail_fast: true
      step :destroy

      def destroy(_, model:, **)
        model.destroy
      end
    end
  end
end
