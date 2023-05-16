class UserlangsController < ApplicationController

    def index
        languages = current_user.languages
        if languages
            render json: languages, status: :ok
        elsif languages.empty?
          render json: {error: 'No languages'}
        else 
            return render json: { errors: language.errors_full_messages }, status: :unprocessable_entity
        end
    end

    def create
        userlang = Userlang.new(user: current_user, language: Language.find(params[:language_id]))
        if userlang.save
          render json: userlang, status: :created
        else
          render json: { errors: userlang.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
      userlang = Userlang.find_by(user_id: current_user, language_id: params[:language_id])
      if userlang
        userlang.toggle!(:learning)
        render json: { message: 'Userlang updated successfully' }, status: :ok
      else
        render json: { error: 'Userlang not found' }, status: :not_found
      end
    end
    
end
