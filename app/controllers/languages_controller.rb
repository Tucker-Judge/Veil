class LanguagesController < ApplicationController
    def index
    #  rendering all languages
        render json: Language.all, status: :ok
    end

    def show
    # this renders the titles of language flashcards join table
        user = User.find([session[:user_id]])
        languages = Language.find_by(id: params[:id])
        
         
        # rendering a user's languages
        render json: languages, serializer: TitlesJoinedSerializer,status: :ok
    end
    def languages
        #  forgot why i put this here but has no current need
        user = User.find([session[:user_id]])
        
        render json: user, include: [:languages]
    end
end
