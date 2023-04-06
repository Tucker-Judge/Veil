class UserlangsController < ApplicationController

    def index
        languages = @current_user.languages
        if languages
            render json: languages, status: :ok
        else 
            return render json: { errors: language.errors_full_messages }, status: :unprocessable_entity
        end
    end

    def create
        userlang = Userlang.new(user: @current_user, language: Language.find(params[:language_id]))
        if userlang.save
          render json: userlang, status: :created
        else
          render json: { errors: userlang.errors.full_messages }, status: :unprocessable_entity
        end
      end
end
