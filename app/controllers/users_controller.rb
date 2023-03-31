class UsersController < ApplicationController
    skip_before_action :authorize, only: :create

    # comment out b4 deployment
    def index
        user = User.all
        render json: user
    end

    def me
        user = User.find_by(id: session[:user_id])
        render json: user
    end

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
        end
    end
    
   

    private 

    def user_params
        params.permit(:username, :password, :email, :password_confirmation, :lang_code)
    end
end
