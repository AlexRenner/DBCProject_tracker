class CohortsController < ApplicationController

  def index
  	if current_user
	  	@cohorts = Cohort.all
	  	@cohort = current_user.cohort
	  	render 'index'
	else
		@errors = ["Please log in to view information about cohorts"]
		redirect_to '/'
	end
  end

  def show
  	@cohort = Cohort.find(params[:id])
  end

  def new
	@cohort = Cohort.new
  end

  def create
	# render plain: params[:cohort].inspect
	@cohort = Cohort.new(cohort_params)#private method call
	if @cohort.save
		redirect_to @cohort #redirects to the show action
	else
		render 'new'
	end
  end

  def update
	  @cohort = Cohort.find(params[:id])
	  if @cohort.pitchable == true
		  if @cohort.update(pitchable: false)
		    redirect_to @cohort
		  else
		    redirect_to @cohorts
		  end
	  else
	  	if @cohort.update(pitchable: true)
		    redirect_to @cohort
		else
		    redirect_to @cohorts
		end
	  end
	end

  private
  def cohort_params
    params.require(:cohort).permit(:name)
  end
end
