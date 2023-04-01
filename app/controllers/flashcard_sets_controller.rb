class FlashcardSetsController < ApplicationController

    # accepting serializer custom method of flashcard that has the flashcardset id
    def update
        set = FlashcardSet.find(params[:id])
        # Guard Clause
        unless set
          return render json: { error: "FlashcardSet not found" }, status: :not_found
        end

        # Update completed
        if !set.completed
            if set.update(completed: true)
                render json: set, status: :ok
            else
                render json: { error: "Failed to update FlashcardSet" }, status: :unprocessable_entity
            end

        # Update review_count
        else 
          new_review_count = set.increment(:review_count)
          if new_review_count
            # current review_count
            # check if useful?
            set.reload 
            render json: set, status: :ok
          else
            render json: { error: "Failed to increment review_count" }, status: :unprocessable_entity
          end
        end
    end
    
    # expecting limits included in user content
    def continue
        limit = params[:limit] || 10
        set = FlashcardSet.where(completed: false).limit(limit)
        if set.exists?
            render json: set, status: :ok
        else 
            render json: { error: "Failed to render flashcard set" }, status: :unprocessable_entity
    end

    def review_content
        # if completed
        # flashcard set including flashcards
        
        content = FlashcardSet.where(completed: true)
        if content.exists?
            render json: content, status: :ok
        else
            render json: { error: "Failed to render review content" }, status: :unprocessable_entity
    end
end
