module Docs
  module V1
    module Registrations
      extend Dox::DSL::Syntax

      document :api do
        resource 'Registrations' do
          endpoint '/auth'
          group 'Registrations'
        end
      end

      document :create do
        action 'Create user'
      end
    end
  end
end
