module Api::V1
  module Project::Operation
    class Update < Trailblazer::Operation
      step Model(::Project, :find_by), fail_fast: true
      step Policy::Guard(Api::V1::Guard::Project::ProjectGuard), fail_fast: true
      step Subprocess(Api::V1::Project::Operation::Persist)
    end
  end
end
