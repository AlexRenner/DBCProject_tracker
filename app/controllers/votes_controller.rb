class VotesController < ApplicationController

	def update
		p "@@@@@@@@@@@@@@@@@"
		p params
		
		@vote = Vote.find(params[:id])
		@vote.update(value: params[:vote])
		redirect_to  :back
	end
end
