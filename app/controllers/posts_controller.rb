class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @new_post = Post.create(user_id: params[:user_id], content: params[:content])

        render json: { post: @new_post }
    end

    def list
        @posts = Post.all

        render json: @posts
    end

    def modify
        @modified_post = Post.find_by_id(params[:id])

        @modified_post.content = params[:content]
        @modified_post.save

        render json: { post: @modified_post }
    end

    def delete
        @deleted_post = Post.find_by_id(params[:id])

        Post.delete(@deleted_post)

        render json: { post: @deleted_post }
    end
end
