module Api::V1
  module Task::Operation
    class Destroy < Trailblazer::Operation
      step Model(::Task, :find_by), fail_fast: true
      step Policy::Guard(Api::V1::Guard::Task::TaskGuard), fail_fast: true
      step :destroy

      def destroy(_, model:, **)
        model.destroy
      end
    end
  end
end
