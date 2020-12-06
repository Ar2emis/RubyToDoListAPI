module Api::V1
  class CommentsController < ApplicationController
    before_action :authorize_access_request!

    def index
      endpoint operation: Api::V1::Comment::Operation::Index, options: options,
               renderer_options: { serializer: CommentSerializer, status: :ok }
    end

    def create
      endpoint operation: Api::V1::Comment::Operation::Create, options: options,
               renderer_options: { serializer: CommentSerializer, status: :created }
    end

    def destroy
      endpoint operation: Api::V1::Comment::Operation::Destroy, options: options, different_handler: destroy_handler,
               renderer_options: { status: :no_content }
    end
  end
end
