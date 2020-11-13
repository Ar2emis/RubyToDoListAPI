class Api::V1::User::Operation::Create < Trailblazer::Operation
  step Model(User, :new)
  step Contract::Build(constant: Api::V1::User::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()
  step :generate_tokens
  step :result

  def generate_tokens(ctx, params:, request:, **)
    result = Api::V1::Session::Operation::Create.call(params: params, request: request)
    ctx[:headers] = result[:headers]
  end

  def result(ctx, model:, **)
    ctx[:result] = model
  end
end
