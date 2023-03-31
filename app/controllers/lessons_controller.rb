class LessonsController < ApplicationController

    def create
        # user = User.find(params[:session[:user_id]])
        # language = Language.find(params[:language_id])
        lesson = Lesson.create!(user_id: session[:user_id], language_id: params[:language_id])
        render json: lesson
        # creates a lesson
    end
    def index
        user = User.find([session[:user_id]])
        render json: user
        # does something but might not be necessary
    end
end
