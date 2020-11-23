module Macro
  include Trailblazer

  # rubocop:disable Naming/MethodName
  def self.FindById(model_class, id_parameter: :id, model: :model)
    # rubocop:enable Naming/MethodName
    step = lambda do |ctx, params:, **|
      ctx[model] = model_class.find_by(id: params[id_parameter])
      return true if ctx[model]

      ctx[:'result.model'] = Operation::Result.new(false, {})
      false
    end

    task = Activity::TaskBuilder::Binary(step)
    { task: task, id: :model }
  end

  # rubocop:disable Naming/MethodName
  def self.Guard(guard_class, model: :model)
    # rubocop:enable Naming/MethodName
    step = lambda do |ctx, current_user:, **|
      result = guard_class.call(ctx, current_user: current_user, model: ctx[model])
      return true if result

      ctx[:'result.policy.default'] = Operation::Result.new(false, {})
      false
    end

    task = Activity::TaskBuilder::Binary(step)
    { task: task, id: :'policy.default' }
  end
end
