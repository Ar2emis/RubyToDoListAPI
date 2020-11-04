class Api::V1::ProjectsController < ApplicationController
  def index
    endpoint operation: Project::Index, options: options,
             renderer_options: { serializer: ProjectSerializer, status: :ok }
  end

  def show
    endpoint operation: Project::Show, options: options,
             renderer_options: { serializer: ProjectSerializer, status: :ok }
  end

  def create
    endpoint operation: Project::Create, options: options,
             renderer_options: { serializer: ProjectSerializer, status: :created }
  end

  def update
    endpoint operation: Project::Update, options: options,
             renderer_options: { serializer: ProjectSerializer, status: :created }
  end

  def destroy
    endpoint operation: Project::Destroy, options: options, renderer_options: { status: :no_content }
  end
end
