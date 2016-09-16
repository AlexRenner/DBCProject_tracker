module CohortHelper

  def current_cohort
    @current_cohort ||= User.find(session[:user_id]).cohort
  end

  def viewed_cohort
    @viewed_cohort ||= Cohort.find(params[:cohort_id])
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
