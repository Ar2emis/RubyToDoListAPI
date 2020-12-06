module Macro
  def self.FindBy(model_class, attribute: :id, parameter: :id, model: :model)
    step = lambda do |ctx, params:, **|
      ctx[model] = model_class.find_by(attribute => params[parameter])
      return true if ctx[model]

      ctx[:'result.model'] = Trailblazer::Operation::Result.new(false, {})
      false
    end
    task = Trailblazer::Activity::TaskBuilder::Binary(step)
    { task: task, id: :model }
  end
end
