class ApplicationController < ActionController::API
  include SimpleEndpoint::Controller
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def not_authorized
    render status: :unauthorized
  end

  def current_user
    @current_user ||= User.find_by(id: payload['user_id'])
  end

  def options
    { current_user: current_user }
  end

  def default_cases
    {
      success: ->(result) { result.success? },
      invalid: ->(result) { result['result.contract.default']&.failure? },
      not_found: ->(result) { result['result.model']&.failure? || result['result.policy.default']&.failure? }
    }
  end

  def default_handler
    {
      success: ->(result, **params) { success_response(result, **params) },
      invalid: ->(result, **) { error_response(result) },
      not_found: ->(_, **) { render status: :not_found }
    }
  end

  def destroy_handler
    { success: ->(_, **) { render status: :no_content } }
  end

  def success_response(result, **params)
    render json: params[:serializer].new(result[:result]), status: params[:status]
  end

  def error_response(result)
    render json: { errors: result['contract.default'].errors.messages }, status: :unprocessable_entity
  end
end
