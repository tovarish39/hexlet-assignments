# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController # rubocop:disable Style/Documentation
    before_action :set_comment, only: %i[show]

    def new
      post = Post.find(params[:post_id])
      @comment = post.post_comments.new
    end

    def create
      post = Post.find(params[:post_id])
      @comment = post.post_comments.new(params_comment)

      if @comment.save
        redirect_to post_path(@comment.post)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @comment = PostComment.find(params[:id])
    end

    def update
      @comment = PostComment.find(params[:id])
      if @comment.update(params_comment)
        redirect_to post_path(@comment.post)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      comment = PostComment.find(params[:id])
      post_id = comment.post.id
      comment.destroy
      redirect_to post_path(post_id)
    end

    private

    def params_comment
      params.require(:post_comment).permit(:content)
    end

    def set_comment
      @comment = PostComment.find(params[:id])
    end
  end
end
