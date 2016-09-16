class TeamsController < ApplicationController
  def new
    @cohort = Cohort.find(params[:cohort_id])
  end

  def show
  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    @team = Team.new(name: team_params[:name])
    if @team.save
      # grabs the keys from the check boxes with student id's
      student_tags = []
      params.each do |key, value|
        if key.include?("student")
          # stores each key with as a string if it says 'student'
          student_tags << key.to_s
        end
      end
      # maps the id's in a new array without the string 'student_'
      student_ids = student_tags.map{|string| string.delete('student_')}
      # finds users with each id and assigns them the new team_id
      student_ids.each do |id|
        User.find(id).update(team: @team)
      end
      # finds project picked in drop down list and assigns team_id
      Project.find(team_params[:project]).update(team: @team)
      # redirects to cohort# show page
      redirect_to cohort_teams_path(@cohort)
    else
      @errors = @team.errors
      render 'new'
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :project)
  end
end
