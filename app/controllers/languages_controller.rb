class LanguagesController < ApplicationController
    
    def index
        render json: Language.all, status: :ok
    end
   
end
