class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @galleries = Gallery.all
  end

end
