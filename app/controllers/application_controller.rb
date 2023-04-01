
    class ApplicationController < ActionController::API
        include ActionController::Cookies
        rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
        
        before_action :authorize
        
        
        private
        
        def authorize
          @current_user = User.find_by(id: session[:user_id])
          render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
        end
        def current_user
          @current_user ||= User.find_by(id: session[:user_id])
        end
      
        def render_unprocessable_entity_response(exception)
          render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
        end
      
        def render_not_found(exception)
          render json: { error: "#{exception} not found"}, status: :not_found
        end
        
      
end




class FlashcardsController < ApplicationController
    
  def show
    # get flashcards from types of the join table
    user = User.find(session[:user_id])
    lang_key = user.lang_code
    card = LanguageFlashcard.find_by(id: params[:id])
    cards_with_title = LanguageFlashcard.where(title: card.title)
    render json: cards_with_title, each_serializer: FinalflashSerializer, lang_key: lang_key
  end
  def uncompleted
    language = Language.find_by(id: params[:id])
    if language.nil?
      render json: { error: "Language not found" }, status: :not_found
      return
    end
    first_cards = language.flashcards.where(completed: false).limit(10)
    user = User.find(session[:user_id])
    lang_key = user.lang_code
    mapped = first_cards.map { |card| { flashcard: FlashcardSerializer.new(card, lang_key: lang_key) } }

    render json: mapped
  end
  def next
    user = User.find(session[:user_id])
    flashcard = Flashcard.find(params[:id])
    next_flash = Flashcard.where("id > ?", flashcard.id).limit(10)
    render json: next_flash, lang_key: user.lang_code
  end
  
end

class LanguageFlashcardsController < ApplicationController
  # skip_before_action :authorize
  def show
      # retrieve the LanguageFlashcard objects with the specified language_id
      flashcards = LanguageFlashcard.where(language_id: params[:id])
    
      # group the flashcards by title
      flashcards_by_title = flashcards.group_by(&:title)
    
      # create an array of arrays, with each inner array containing the id and titles for a given group
      title_groups = flashcards_by_title.values.map { |group| [id: group.first.id, title: group.map(&:title).uniq] }
    
      # render the title_groups array as JSON
      render json: title_groups
    end

end

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