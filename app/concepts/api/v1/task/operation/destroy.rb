class Api::V1::Task::Operation::Destroy < Trailblazer::Operation
  step Policy::Guard(Api::V1::Guard::Access.new), fail_fast: true
  step Policy::Guard(Api::V1::Guard::TaskExists.new, name: :existance), fail_fast: true
  step Model(Task, :find_by)
  step :reprioritate
  step :destroy

  def reprioritate(_, model:, **)
    model.remove_from_list
  end

  def destroy(_, model:, **)
    model.destroy
  end
end
