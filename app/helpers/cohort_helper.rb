module CohortHelper

  def current_cohort
      @current_cohort ||= User.find(session[:user_id]).cohort
  end

  def latest_round
    current_cohort.rounds.distinct.last
  end

  def votable?
    latest_round.votable
  end

  def

end
