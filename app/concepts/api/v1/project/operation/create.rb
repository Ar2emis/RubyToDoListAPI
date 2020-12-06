module Api::V1
  module Project::Operation
    class Create < Trailblazer::Operation
      step Model(::Project, :new), fail_fast: true
      step Subprocess(Api::V1::Project::Operation::Persist)
    end
  end
end
