class Api::V1::Auth::AuthController < ApplicationController
  private

  def before_response
    { success: ->(result, **) { response.headers.merge!(result[:headers]) } }
  end
end
