class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    def index
      @posts = Post.paginate(page: params[:page], per_page: 5)
    end
    
    def new
      @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user = User.first
          if @post.save
            flash[:notice] = "Posts was created successfully."
            redirect_to posts_path
          else
            render 'new'
          end
     end

    def show
    end

    def edit
    end

    def update
      if @post.update(post_params)
        flash[:notice] = "Post was updated successfully."
        redirect_to posts_path
      else 
        render 'edit' 
      end
    end

    def confirm
      @post = Post.new(post_params)
      render 'new' if @post.invalid?
    end

    def destroy
      @post.destroy
      redirect_to posts_path
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description)
    end

end