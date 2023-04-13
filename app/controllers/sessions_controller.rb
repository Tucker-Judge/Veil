class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def create
      user = User.find_by_email(params[:email])
    
      if user&.valid_password?(params[:password])
        # Authenticate the user
        sign_in user
    
        # Set the remember me cookie if the "remember me" checkbox was selected
        if params[:remember_me]
          remember_me user
        end
    
        render json: { message: 'User authenticated' }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
    

  def destroy
    session.delete :user_id
    head :no_content
  end

  def validate
    user_id = session[:user_id]
    valid_user = User.exists?(user_id)
    render json: { valid: valid_user }
  end
end