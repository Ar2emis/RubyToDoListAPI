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
      not_found: ->(result) { result['result.model'].nil? || result['result.policy.existance']&.failure? }
    }
  end

  def default_handler
    {
      success: ->(result, **params) { render json: params[:serializer].new(result[:result]), status: params[:status] },
      invalid: lambda { |result, **|
                 render json: { errors: result['contract.default'].errors.messages }, status: :unprocessable_entity
               },
      not_found: ->(_, **) { render status: :not_found },
      unathorized: ->(_, **) { render status: :unauthorized }
    }
  end

  def destroy_handler
    { success: ->(_, **params) { render json: { success: true }, status: params[:status] } }
  end
end
