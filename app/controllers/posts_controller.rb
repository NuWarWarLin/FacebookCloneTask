class PostsController < ApplicationController

    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(params.require(:post).permit(:title, :description))
        if @post.save
          flash[:notice] = "Posts was created successfully."
          redirect_to @post
        else
          render 'new'
        end
     end

     def show
        @post = Post.find(params[:id])
      end

end