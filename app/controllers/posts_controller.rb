class PostsController < ApplicationController
    skip_before_action :authorized!, only: [:index]
    before_action :find_post, only: [:show, :update, :destroy]

    def index #get "/posts"
        binding.pry
        render json: PostSerializer.new(Post.preload(:comments)).serializable_hash
    end

    def ordered
        render json: Post.sort_desc_by_title
    end

    def most_comments
        render json: Post.most_comments
    end

    def show #get "/posts/:id"
        render json: serialized_post
    end

    def create #post "/posts" "users/17/posts" "users/99/posts"
        @post = current_user.posts.create!(post_params)
        # if @post.id
        render json: serialized_post, status: 201
        # else
            # render json: {error: @post.errors.full_messages.to_sentence}
        # end
    end

    def update #patch "/posts/:id"
        if current_user.posts.include?(@post)
            @post&.update!(post_params)
            render json: serialized_post
        else
            no_route
        end
        # else
        #     render json: {error: @post.errors.full_messages.to_sentence}
        # end
    end

    def destroy #delete "/posts/:id"
        if current_user.posts.include?(@post)
            if @post&.destroy
                render json: {message: "Successfully destroyed post!"}
            else
                render json: {error: @post.errors.full_messages.to_sentence}
            end
        else
            no_route
        end
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def serialized_post
        @post.to_json(include: :comments)
    end

    def post_params
        params.require(:post).permit(:title, :content, :media_url, :delete_time)
    end
end
