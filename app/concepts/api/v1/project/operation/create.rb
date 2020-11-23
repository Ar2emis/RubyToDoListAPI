module Api::V1
  module Project::Operation
    class Create < Trailblazer::Operation
      step Model(::Project, :new), fail_fast: true
      step Subprocess(Persist)
    end
  end
end
