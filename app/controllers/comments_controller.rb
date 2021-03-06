class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :update, :destroy]

    def index #get "/comments" get "posts/:post_id/comments"
        if params[:post_id] #is there a route parameter? AKA do I come from a nested route?
            post = Post.find(params[:post_id])
            render json: post.comments
        else # get "/comments"
            render json: CommentSerializer.new(Comment.all).serializable_hash
        end
    end

    def show #get "/comments/:id"
        render json: serialized_comment
    end

    def create #post "/comments" #post "posts/:post_id/comments"
        if params[:post_id] #is there a route parameter?
            post = Post.find(params[:post_id])
            @comment = post.comments.create!(comment_params)
            # if @comment.id
            render json: serialized_comment, status: 201
            # else
                # render json: {error: @comment.errors.full_messages.to_sentence}, status: 404
            # end
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
