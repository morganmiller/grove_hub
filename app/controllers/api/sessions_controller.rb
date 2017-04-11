class Api::SessionsController < Api::ApiController
  skip_before_action :authenticate_user!, only: [:login]

  def login
    user = User.find_by(email: auth_params[:email])
    if user && user.valid_password?(auth_params[:password])
      sign_in("user", user)
      render json: {user: {
        email: current_user.email,
        id: current_user.id,
        jwt: JWTWrapper.encode({user_id:current_user.id})
      }}.to_json
    else
      render json: {
        error: "Invalid username or password"
      }, status: 401
    end
  end

private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
