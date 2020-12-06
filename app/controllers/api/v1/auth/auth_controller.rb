module Api::V1
  module Auth
    class AuthController < ApplicationController
      private

      def before_response
        { success: ->(result, **) { response.headers.merge!(result[:headers]) } }
      end
    end
  end
end
