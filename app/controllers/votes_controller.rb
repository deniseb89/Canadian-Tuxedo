class VotesController < ApplicationController

	 def gallery_vote
    vote = params[:vote]
    look_id = params[:look_id]
    user_id = current_user.id
    user_vote = Vote.find_by(look_id: look_id, user_id: user_id)
    if user_vote
      if user_vote.vote == vote.to_i
        vote = 0
      end
    	user_vote.update(vote: vote)
    else
      Vote.create(vote: vote, look_id: look_id, user_id: user_id)
    end



    respond_to do |format|
      format.json {render :nothing => true}
    end



  end


  def get_votes
    votes = current_user.votes
    respond_to do |format|
      format.json { render :json => votes}
    end
  end


end