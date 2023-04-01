class FlashcardsController < ApplicationController


    
    def show
        flashcards = Flashcard.where(title: params[:title])

        if flashcards.any? 
            render json: flashcards
        else
            render json: {error: "Flashcards not found"}, status: :not_found
        end

        rescue StandardError => e
            render json: { error: e.message }, status: :unprocessable_entity
    end

    def titles
        # Unique titles
        titles = Flashcard.where(type: params[:type]).distinct.pluck(:title)
            render json: titles
        rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
      
    def types
        # Unique types
        types = Flashcard.distinct.pluck(:types)
            render json: types
        rescue_from StanddardError => e
            render json: {error: e.message}, status: :unprocessable_entity
    end

    def next
        
        # last card + 1 --done on client side
        flashcard = Flashcard.find(params[:id])
        limit = params[:limit] || 10
        # take in limit from user flashcards through serializer
        # Next flashcards with same title
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
