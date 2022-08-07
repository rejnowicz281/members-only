class PostsController < ApplicationController
    before_action :require_login, only: [:new, :create]
    def index
        @posts = Post.all
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

    def require_login
      unless signed_in?
        flash[:error] = "You must be signed in to do this action"
        redirect_to new_user_registration
      end
    end
end
