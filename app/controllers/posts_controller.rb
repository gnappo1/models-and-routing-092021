class PostsController < ApplicationController
    def index
        render json: Post.sort_desc_by_title
    end

    def ordered
        render json: Post.sort_desc_by_title
    end
end
