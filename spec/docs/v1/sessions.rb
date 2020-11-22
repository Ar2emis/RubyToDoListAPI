module Docs
  module V1
    module Sessions
      extend Dox::DSL::Syntax

      document :api do
        resource 'Sessions' do
          endpoint '/auth'
          group 'Sessions'
        end
      end

      document :create do
        action 'Create session'
      end

      document :destroy do
        action 'Destroy session'
      end
    end
  end
end
