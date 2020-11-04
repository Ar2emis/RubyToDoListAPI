class ApplicationController < ActionController::API
  include SimpleEndpoint::Controller

  private

  def options
    { request: request }
  end

  def default_cases
    {
      success: ->(result) { result.success? },
      unathorized: ->(result) { result['result.policy.default']&.failure? },
      invalid: ->(result) { result['result.contract.default']&.failure? },
      not_found: ->(result) { result['result.model'].nil? }
    }
  end

  def default_handler
    { success: lambda do |result, serializer: nil, **options|
                 return render(**options) unless result[:model]

                 render json: serializer ? serializer.new(result[:model]) : result[:model], **options
               end,
      invalid: lambda do |result, **|
                 render json: { errors: result['contract.default'].errors.messages }, status: :unprocessable_entity
               end,
      not_found: ->(_, **) { render status: :not_found },
      unathorized: ->(_, **) { render status: :unauthorized } }
  end
end
