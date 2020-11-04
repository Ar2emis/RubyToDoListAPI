class Api::V1::TasksController < ApplicationController
  def index
    endpoint operation: Task::Index, options: options, renderer_options: { serializer: TaskSerializer, status: :ok }
  end

  def show
    endpoint operation: Task::Show, options: options, renderer_options: { serializer: TaskSerializer, status: :ok }
  end

  def create
    endpoint operation: Task::Create, options: options,
             renderer_options: { serializer: TaskSerializer, status: :created }
  end

  def update
    endpoint operation: Task::Update, options: options,
             renderer_options: { serializer: TaskSerializer, status: :created }
  end

  def destroy
    endpoint operation: Task::Destroy, options: options, renderer_options: { status: :no_content }
  end

  def complete
    endpoint operation: Task::Complete, options: options,
             renderer_options: { serializer: TaskSerializer, status: :created }
  end

  def position
    endpoint operation: Task::Position, options: options,
             renderer_options: { serializer: PositionSerializer, status: :created }
  end
end
