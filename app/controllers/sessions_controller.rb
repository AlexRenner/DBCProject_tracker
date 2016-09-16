class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params['email'], params['password'])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = 'Email or password is incorrect'
      render 'new'
    end
  end


  def destroy
    session.clear
    redirect_to  '/'
  end
end
