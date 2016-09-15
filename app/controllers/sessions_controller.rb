class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params['email'], params['password'])
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end


  def destroy
    session.clear
    redirect_to  '/'
  end
end
