module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
		@user ||= User.find(session[:user_id])
	end
end
