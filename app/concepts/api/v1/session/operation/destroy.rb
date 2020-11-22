module Api::V1
  module Session::Operation
    class Destroy < Trailblazer::Operation
      step :flush_session
      step :result

      def flush_session(_, payload:, **)
        JWTSessions::Session.new(refresh_by_access_allowed: true, payload: payload).flush_by_access_payload
      end

      def result(ctx, **)
        ctx[:result] = { success: true }
      end
    end
  end
end
