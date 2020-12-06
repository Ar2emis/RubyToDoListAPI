module Macro
  def self.Guard(guard_class, model: :model)
    step = lambda do |ctx, current_user:, **|
      result = guard_class.call(ctx, current_user: current_user, model: ctx[model])
      return true if result

      ctx[:'result.policy.default'] = Trailblazer::Operation::Result.new(false, {})
      false
    end
    task = Trailblazer::Activity::TaskBuilder::Binary(step)
    { task: task, id: :'policy.default' }
  end
end
