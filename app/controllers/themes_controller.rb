class ThemesController < ApplicationController
  before_action :authenticate_user!

  def index
    @themes = []
    Theme.order(vote_count: :desc).each do |theme|
      vote = Vote.where(theme: theme, user: current_user).last

      if vote
        button_type = 'unvote'
      else
        button_type = 'vote'
      end

      @themes << {theme: theme, vote: vote, button_type: button_type}
    end
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
