class SessionsController < ApplicationController
  def new
  	#debugger
  end

  def create
  	if ( @user = User.find_by(name: params[:session][:name]) )
  		log_in(@user)
  		flash[:success] = "Successfully logged in!"
  		redirect_to @user
  	else
  		flash.now[:danger] = "User doesn't exist"
  		render :new
  	end
  end
end
