class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @galleries = Gallery.order(start_date: :desc)
  end

  def show
    @gallery = Gallery.current_gallery
  end

end
