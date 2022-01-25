class SessionsController < ApplicationController

	skip_before_action :require_login

	def create
    user = User.find_by(email: session_params[:email]) || User.find_by(username: session_params[:username])
    render json: { response: "unknown" } and return if !user
    if user.authenticate(session_params[:password])
      jwt = Auth.issue({user: user.id})
      render json: { response: "ok", jwt: jwt }
    else
			render json: { response: "no", jwt: jwt }
    end
  end

private

	def session_params
		params.permit(:email, :username, :password)
	end
end
