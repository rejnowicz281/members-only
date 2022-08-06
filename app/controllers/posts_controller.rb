class PostsController < ApplicationController
    def index
        @post = Post.all
    end
      
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
    
        if @post.save
          redirect_to @post
        else
          render :new, status: :unprocessable_entity
        end
    end
    
    private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end