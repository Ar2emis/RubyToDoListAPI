module Api::V1
  module Task::Operation
    module Position
      class Update < Trailblazer::Operation
        step ::Macro::FindBy(::Task, parameter: :task_id)
        step Policy::Guard(Api::V1::Guard::Task::TaskGuard), fail_fast: true
        step Contract::Build(constant: Api::V1::Task::Contract::Position)
        step Contract::Validate()
        pass :reprioritate
        step :result

        def reprioritate(_, model:, params:, **)
          Api::V1::ReprioritateService.call(task: model, position: params[:position])
        end

        def result(ctx, model:, **)
          ctx[:result] = model
        end
      end
    end
  end
end
