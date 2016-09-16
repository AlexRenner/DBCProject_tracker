class ProjectsController < ApplicationController
  
  def index 
  	@cohort = Cohort.find(params[:cohort_id])
  	@projects = @cohort.projects
  end 

  def new
  	@cohort = Cohort.find(params[:cohort_id])
  end

  def create
    @project = Project.new(title: project_params[:title], description: project_params[:description], user_id: current_user.id, cohort_id: params[:cohort_id] )
    @cohort = Cohort.find(params[:cohort_id])
    @projects = @cohort.projects

    if @project.save
    	@project.user_id = current_user.id
    	@project.cohort_id = params[:cohort_id]
    	render 'index'
    else
        @project.errors.full_messages
        render 'new'
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end


