class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :authorize_user, except: [:index]

  def index
    @galleries = Gallery.all
    @galleries.each do |gallery|
      @submissions = gallery.submissions
    end
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:accepted] = "Gallery Added!"
      redirect_to galleries_path
    else
      flash[:errors] = @gallery.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
  end

  protected

  # def authorize_user
  #   @gallery = Gallery.find(params[:id])
  #   if !current_user.admin?
  #     raise ActionController::RoutingError.new("Not Found")
  #   end
  # end

  def gallery_params
    list = [:theme, :start_date, :end_date]
    params.require(:gallery).permit(list)
  end
end
