class CohortsController < ApplicationController

  def index
  	# if current_user
	  	@cohorts = Cohort.all
	  	@cohort = current_user.cohort
	  	# render 'index'
	# else
	# 	@errors = ["Please log in to view information about cohorts"]
	# 	redirect_to '/'
	# end
  end

end