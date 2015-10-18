class VotesController < ApplicationController
  def create
    theme = Theme.find(params[:theme_id])
    vote = Vote.find_or_create_by(theme: theme, user: current_user)
    theme.vote_count = theme.votes.count

    respond_to do |format|
      format.json { render json: vote }
    end
  end

  def destroy
    vote = Vote.find(params[:id])
    theme = vote.theme
    vote.destroy
    theme.vote_count = theme.votes.count

    respond_to do |format|
      format.json { render json: theme }
    end
  end
end
