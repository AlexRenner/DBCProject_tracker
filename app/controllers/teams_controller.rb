class TeamsController < ApplicationController
  def new
    @cohort = Cohort.find(params[:cohort_id])
  end

  def show
  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    @team = Team.new(team_params[:name])
    if @team.save
      student_tags = []
      params.each do |key, value|
        if key.include?("student")
          student_tags << key.to_s
        end
      end
      student_ids = student_tags.map{|string| string.delete('student_')}
      student_ids.each do |id|
        Student.find(id).team = @team
      end
      Project.find(team_params[:project_id]).team = @team
      render cohort_teams_path(@cohort)
    else
      @errors = @team.errors.full_messages
      render new_cohort_team_path
    end
  end
end
