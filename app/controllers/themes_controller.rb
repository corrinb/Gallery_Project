class ThemesController < ApplicationController
  def index
    @themes = Theme.order(vote_count: :desc)
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      flash[:accepted] = "Your Nomination Has Been Added"
      redirect_to themes_path
    else
      flash[:errors] = @theme.errors.full_messages.join(". ")
      render :new
    end
  end

  protected

  def theme_params
    list = [:title]
    params.require(:theme).permit(list)
  end

end
