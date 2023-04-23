class LanguagesController < ApplicationController
# skip_before_action :authorize, only: [:index]
    def index
        languages = Language.all
        if languages.empty?
            render json: { error: "Languages not found"}, status: :not_found
        end
        render json: languages, each_serializer: LanguageSerializer, status: :ok 
    end
end
