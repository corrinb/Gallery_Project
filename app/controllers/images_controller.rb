class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  # before_action :authorize_user, only: [:edit, :update, :destroy]

  def show
    @image = Image.find(params[:id])
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

  # def authorize_user
  # end

  def image_params
    list = [:submission, :title]
    params.require(:image).permit(list)
  end
end
