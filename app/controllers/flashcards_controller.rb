
  class FlashcardsController < ApplicationController
#     def index
# # if user logic otherwise lang_key from post and language from state
#       user = User.find(1)
#       languageuser = LanguageFlashcard.find_by(language_id: 5)
#     # language = user.languages
#       lang_key = user.lang_code
#       flashcards = languageuser.flashcards
#       render json: flashcards, lang_key: lang_key
#     #   , each_serializer: FlashcardSerializer, 
#     end
    
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
  