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
  		redirect_to @user #redirects to the show action
  	else
  		render 'new'
  	end
  end

  def edit
    if current_user && current_user.teacher
      @user = User.find(params[:id])
      render 'edit'
    else
      puts "not a teacher"
      redirect_to '/'
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user.teacher && @user.update(user_params)
      redirect_to '/'
    else
      render 'edit'
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :cohort_id, :teacher)
  end

end
