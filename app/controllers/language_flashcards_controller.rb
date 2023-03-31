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

    
      
      
      
    # def show
    #     # get flashcards from types of the join table
    #     card = LanguageFlashcard.find_by(id: params[:id])
    #     cards_with_title = LanguageFlashcard.where(title: card.title)
    #     render json: cards_with_title, each_serializer: FinalflashSerializer, lang_key: "en-US"
    #   end
#     def show
#         # display join table where language id = params
#         language_flashcards = LanguageFlashcard.includes(:flashcard).where(language_id: params[:id])
#         lang_key = User.find(1).lang_code
#         # flashcard_attributes = language_flashcards.map { |lf| lf.flashcard.attributes }
        

# render json: language_flashcards, lang_key: lang_key
#     end
# def show
#     # Fetch all LanguageFlashcards where language_id = params[:id],
#     # and eagerly load the associated Flashcard records
#     language_flashcards = LanguageFlashcard.where(language_id: params[:id])
  
#     # Extract the Flashcard attributes from each LanguageFlashcard record
#     # flashcard_attributes = language_flashcards.map { |lf| lf.flashcard.attributes }
  
#     # # Render the Flashcard attributes as JSON, along with the lang_key
#     lang_key = User.find(1).lang_code
#     # render json: flashcard_attributes, serializer: lang_key: lang_key
#     render json: language_flashcards, lang_key: lang_key
#   end
  

    private


end
