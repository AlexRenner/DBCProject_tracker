module CohortHelper

  def current_cohort
    @current_cohort ||= User.find_by(id: session[:user_id]).cohort
  end

  def viewed_cohort
    @viewed_cohort ||= Cohort.find_by(id: params[:cohort_id])
  end

  def latest_round
    @latest_round ||= current_cohort.rounds.last
  end

  def votable?
    latest_round.votable
  end

  def pitchable?
    current_cohort.pitchable
  end

end
