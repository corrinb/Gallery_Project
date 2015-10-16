class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user
    @image.gallery = Gallery.current_gallery
    if @image.save
      flash[:accepted] = "Image Added!"
      redirect_to image_path(@image)
    else
      flash[:errors] = @image.errors.full_messages.join(". ")
      render :new
    end
  end

  protected

  def image_params
    list = [:submission, :title]
    params.require(:image).permit(list)
  end
end
