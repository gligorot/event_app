class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user 	= User.find(params[:id])
  	@events = @user.created_events
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:suceess] = "Sucessfully created a new user!"
  		redirect_to @user
  	else
  		flash.now[:danger] = "Error"
  		render :new
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:name)
  	end
end
