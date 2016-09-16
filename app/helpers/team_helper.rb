module TeamHelper
  def current_team
    @current_team ||= Team.find_by(id: params[:id])
  end

  def team_members
    @team_members ||= current_team.students
  end

  def unassigned_students
    @unassigned_students ||= User.where(cohort_id: @cohort.id, team_id: 1, teacher: false)
  end

  def unassigned_projects
    @unassigned_projects ||= Project.where(cohort_id: params[:cohort_id], team_id: 1)
  end
end
