module UserHelper
	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

  def user_team
    if current_user.team_id != nil
      @team ||= Team.find_by(id: current_user.team_id)
    else
      return false
    end
  end
end
