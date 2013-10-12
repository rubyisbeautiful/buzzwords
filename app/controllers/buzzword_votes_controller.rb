class BuzzwordVotesController < ApplicationController


  # POST /buzzword_votes
  def create
    BuzzwordVote.new(params[:buzzword]).vote
    render :nothing => true, :status => :ok
  end

end
