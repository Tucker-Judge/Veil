class UsersController < ApplicationController
    skip_before_action :authorize, only: :create

    def index
        user = User.all
        render json: user
    end

    def me
        user = User.find_by(id: session[:user_id])
        render json: user
    end

    def create
        @user = User.new(user_params)
          
        if @user.save
              # Send a confirmation email
              UserMailer.welcome_email(@user).deliver_now
              render json: { message: 'User created' }, status: :created
        else
              render json: { error: 'Unable to create user' }, status: :unprocessable_entity
        end
          
    end
    
   

    private 

    def user_params
        params.permit(:username, :password, :email, :password_confirmation, :lang_code)
    end
end
