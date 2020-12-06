module Api::V1
  class TasksController < ApplicationController
    before_action :authorize_access_request!

    def index
      endpoint operation: Api::V1::Task::Operation::Index, options: options,
               renderer_options: { serializer: TaskSerializer, status: :ok }
    end

    def show
      endpoint operation: Api::V1::Task::Operation::Show, options: options,
               renderer_options: { serializer: TaskSerializer, status: :ok }
    end

    def create
      endpoint operation: Api::V1::Task::Operation::Create, options: options,
               renderer_options: { serializer: TaskSerializer, status: :created }
    end

    def update
      endpoint operation: Api::V1::Task::Operation::Update, options: options,
               renderer_options: { serializer: TaskSerializer, status: :created }
    end

    def destroy
      endpoint operation: Api::V1::Task::Operation::Destroy, options: options, different_handler: destroy_handler,
               renderer_options: { status: :no_content }
    end

    def complete
      endpoint operation: Api::V1::Task::Operation::Complete, options: options,
               renderer_options: { serializer: TaskSerializer, status: :created }
    end

    def position
      endpoint operation: Api::V1::Task::Operation::Position::Update, options: options,
               renderer_options: { serializer: PositionSerializer, status: :created }
    end
  end
end
