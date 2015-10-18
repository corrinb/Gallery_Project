class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @galleries = Gallery.order(start_date: :desc)
  end

  def show
    @gallery = Gallery.find(params[:id])
  end
end
