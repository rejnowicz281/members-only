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
        @post.user = current_user
    
        if @post.save
          redirect_to root_path
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
        flash[:error] = "You must be logged in to do this action"
        redirect_to new_user_session_path
      end
    end
end
