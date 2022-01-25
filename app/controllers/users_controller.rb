include BCrypt

class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  
  skip_before_action :require_login, only: [ :create, :show ]
  
  # GET /current_user
  def current_user
		@user = cu
  end

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # POST /users
  def create
		password_digest = Password.create(params[:password]);
		user = User.find_by(email: params[:email])
		render json: { response: "exists" } and return if !!user
    @user = User.new({
			email: params[:email],
			password_digest: password_digest
		})
		begin
			@user.save!
			jwt = Auth.issue({user: @user.id})
      render json: { response: "ok", jwt: jwt }
    rescue 
      render json: { response: "no", error: e }
    end
  end

  # PATCH/PUT /users/1
  def update
		if not cu.authenticate(user_params[:password]) # require password
			render json: { errors: ["Incorrect password."] } and return
		end
		new_username = params[:new_username] || cu.username
    if cu.update(user_params.merge({username: new_username}))
      render json: @user
    else
      render json: { errors: @user.errors }
    end
  end

  # DELETE /users/1
  def destroy
		# bullet does not delete users
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(username: params[:username])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:email, :username, :name, :bio, :admin, :editor, :contributor, :password)
    end
end
