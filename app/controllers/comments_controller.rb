class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :update, :destroy]

    def index #get "/comments"
        if params[:post_id] #is there a route parameter?
            post = Post.find(params[:post_id])
            render json: post.comments
        end
    end

    def show #get "/comments/:id"
        render json: serialized_comment
    end

    def create #post "/comments"
        @comment = Comment.create(comment_params)
        if @comment 
            render json: serialized_comment
        else
            render json: {error: @comment.errors.full_messages.to_sentence}
        end
    end

    def update #patch "/posts/:id"
        if @comment&.update(comment_params) 
            render json: serialized_comment
        else
            render json: {error: @comment.errors.full_messages.to_sentence}
        end
    end

    def destroy #delete "/posts/:id"
        if @comment&.destroy
            render json: {message: "Successfully destroyed comment!"}
        else
            render json: {error: @comment.errors.full_messages.to_sentence}
        end
    end

    private

    def find_comment
        @comment = Comment.find(params[:id])
    end

    def serialized_comment
        @comment.to_json(include: :post)
    end

    def comment_params
        params.require(:comment).permit(:rating, :content, :post_id)
    end
end
