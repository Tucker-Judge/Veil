class FlashcardsController < ApplicationController

    def show
        limit = params[:limit]||10
        # have to do id here
        flashcards = Flashcard.where(id: params[:id])

        if flashcards.any? 
            render json: flashcards, lang_code: @lang_code
        else
            render json: {error: "Flashcards not found"}, status: :not_found
        end

        rescue StandardError => e
            render json: { error: e.message }, status: :unprocessable_entity
    end

    def next
        # last card + 1 --done on client side
        flashcard = Flashcard.find(params[:id])
        limit = params[:limit] || 10
        # take in limit from user flashcards through serializer
        # Next flashcards with same title
        # Where with limit included for optimization
        next_flash = Flashcard.where("id > ? AND title = ?", flashcard.id,flashcard.title).limit(limit)
            
        if next_flash.present?
            render json: next_flash
        else
            render json: { error: 'Flashcard set not found' }, status: :not_found
        end
        rescue StandardError => e
          render json: { error: e.message }, status: :unprocessable_entity
    end

end
