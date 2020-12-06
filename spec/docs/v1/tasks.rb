module Docs
  module V1
    module Tasks
      extend Dox::DSL::Syntax

      document :api do
        resource 'Tasks' do
          endpoint '/tasks'
          group 'Tasks'
        end
      end

      document :index do
        action 'List of tasks'
      end

      document :show do
        action 'Task details'
      end

      document :create do
        action 'Create a task'
      end

      document :update do
        action 'Update a task'
      end

      document :destroy do
        action 'Destroy a task'
      end

      document :complete do
        action 'Compelete a task'
      end

      document :position do
        action 'Change task position'
      end
    end
  end
end
