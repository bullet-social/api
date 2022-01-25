class ApplicationController < ActionController::API
	
	before_action :require_login 
	
	def require_login # require logged in user before request (default)
		if not cu
			render json: {error: "unauthorized"}, status: 401 
		end
	end
	
private

	def cu # current user
		User.find(decoded_jwt_token['user']) if !!token
	end

	def token # jwt token
		request.env["HTTP_AUTHORIZATION"]
	end
	
	def decoded_jwt_token # decoded token
		Auth.decode(token)
	end
end
