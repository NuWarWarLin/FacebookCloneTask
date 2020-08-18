class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @images = Image.all
  end


  def show

  end


  def new
    @image = Image.new
  end


  def edit

  end


  def create
    @image = Image.new(image_params)
    @image.user = current_user
    if params[:back]
      render :new
    else
      if @image.save
        flash[:notice] = "Image is successfully created!"
        redirect_to @image
      else
        render 'new'
      end
    end
  end

  def update
    if @image.update(image_params)
      flash[:notice] = "Image is successfully Edited"
      redirect_to @image
    else
      render 'edit'
    end
  end

  def destroy
    if @image.destroy
      flash[:notice] = "Image is Successfully Deleted!"
      redirect_to images_path
    end
  end

  def confirm
    @image = Image.new(image_params)
    @image.user = current_user
    render 'new' if @image.invalid?
  end

  private
    
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:name, :picture, :picture_cache, :user_id)
    end

    def require_same_user
      if current_user != @image.user
        flash[:alert] = "You can only edit or delete your own posts"
        redirect_to @image
      end
    end

end
