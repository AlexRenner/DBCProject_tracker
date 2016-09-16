class TeamsController < ApplicationController
  def new
    @cohort = Cohort.find(params[:cohort_id])
  end

  def show
  end

  def create

  end
end
