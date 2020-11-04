class Api::V1::CommentsController < ApplicationController
  def index
    endpoint operation: Comment::Index, options: options,
             renderer_options: { serializer: CommentSerializer, status: :ok }
  end

  def create
    endpoint operation: Comment::Create, options: options,
             renderer_options: { serializer: CommentSerializer, status: :created }
  end

  def destroy
    endpoint operation: Comment::Destroy, options: options, renderer_options: { status: :no_content }
  end
end
