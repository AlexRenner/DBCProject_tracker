class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
		# # render plain: params[:article].inspect
		# p user_params
  	@user = User.new(user_params)#private method call
  	if @user.save
  		session[:user_id] = @user.id
  		p "@@@@@@@@@@@@@@"
  		p session[:user_id]
  		redirect_to @user #redirects to the show action
  	else
  		render 'new'
  	end
  end

  def show
    if current_user
      render 'show'
    else
      render 'index'
    end
  end


  private
  def user_params
    p params.require(:user).permit(:first_name, :last_name, :email, :password, :cohort_id)
  end

end
