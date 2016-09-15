class UsersController < ApplicationController
  def index
  end

  def new
  end

  def show
    if current_user
      render 'edit'
    else
      redirect_to '/'
    end
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
      p @user.errors
      render 'edit'
    end
  end

  private
  def user_params
    p params.require(:user).permit(:first_name, :last_name, :email, :password, :cohort_id, :teacher)
  end

end
