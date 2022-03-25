class CommentsController < ApplicationController

    def index
        if params[:post_id]
            post = Post.find_by_id(params[:post_id])
            if post
                render json: post.comments
            else
                render json: {error: "Cannopt find post with id #{params[:post_id]}"}
            end
        # else
        #     render json: Comment.all
        end
    end
end
