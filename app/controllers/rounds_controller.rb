class RoundsController < ApplicationController

	def create 
		@round = Round.new(votable: true, cohort_id: params[:cohort_id])
		if @round.save
			redirect_to @round.cohort #redirects to the show action
		else
			redirect_to @cohorts
		end
	end
	
	def update
	  @round = Round.find(params[:id])
	 
	  if @round.update(votable: false)
	    redirect_to @round.cohort
	  else
	    redirect_to @cohorts
	  end
	end 
end