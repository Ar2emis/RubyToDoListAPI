module Api::V1
  class ProjectsController < ApplicationController
    before_action :authorize_access_request!

    def index
      endpoint operation: Api::V1::Project::Operation::Index, options: options,
               renderer_options: { serializer: ProjectSerializer, status: :ok }
    end

    def show
      endpoint operation: Api::V1::Project::Operation::Show, options: options,
               renderer_options: { serializer: ProjectSerializer, status: :ok }
    end

    def create
      endpoint operation: Api::V1::Project::Operation::Create, options: options,
               renderer_options: { serializer: ProjectSerializer, status: :created }
    end

    def update
      endpoint operation: Api::V1::Project::Operation::Update, options: options,
               renderer_options: { serializer: ProjectSerializer, status: :created }
    end

    def destroy
      endpoint operation: Api::V1::Project::Operation::Destroy, options: options, different_handler: destroy_handler,
               renderer_options: { status: :no_content }
    end

    private

    def endpoint_options
      { params: params.merge(user: current_user) }
    end
  end
end
