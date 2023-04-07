class FlashcardSetsController < ApplicationController
    before_action :find_flashcard_set, only: :update
    before_action :find_language, except: :update
    # accepting serializer custom method of flashcard that has the flashcardset id
    def update
        # Update completed
        if !@set.completed
            if @set.update(completed: true)
                render json: @set, status: :ok
            else
                render json: { error: "Failed to update FlashcardSet" }, status: :unprocessable_entity
            end
        # Update review_count
        else
            if @set.increment!(:review_count) 
            render json: @set, status: :ok
            else
            render json: { error: "Failed to increment review_count" }, status: :unprocessable_entity
            end
        end
    end
  
    def continue
        # find last updated and add one
        language = Language.find(params[:language])
        flashcard_set = language.flashcard_sets.find_by(completed: false, card_type: params[:card_type])
        
        if flashcard_set.present?
          render json: flashcard_set, status: :ok
        else
          render json: { error: "Failed to render flashcard set" }, status: :unprocessable_entity
        end
      end
      
    def review_content
      # redis and sidekiq
      # pagination? <= doesnt allow filtering
      # caching results
      # asynchronously appending to the cache when finishing a set
      # background worker can create public cards for other users
        # optimization super necessary
        # flashcard set including flashcards
        language = Language.find(params[:language])
        content = FlashcardSet.where(completed: true)
        # filter options
        if content.exists?
            render json: content, lang_code: lang_code, status: :ok
        else
            render json: { error: "Failed to render review content" }, status: :unprocessable_entity
        end
    end

    def titles
      begin
        page = 1
        per_page = (params[:per_page].presence || 10).to_i
        card_type = params[:card_type]
        language = Language.find(params[:language])
       
        uncompleted_title = language.flashcard_sets.where(card_type: card_type, completed: false).first
        
   
        if params[:page].present?
          page = params[:page].to_i
        elsif uncompleted_title.present?
          page = (uncompleted_title.id / per_page.to_f).ceil
        else
          @last_page ||= language.flashcard_sets.where(card_type: card_type).count
          page = @last_page
        end
        #  want to set page to the total amount
        #  instance var for last completed

        # continue takes it from last updated
        titles = FlashcardSet.where(card_type: card_type).select(:id, :title).paginate(page: page, per_page: per_page).order(:id)
        total_title_pages = (titles.count / per_page.to_f).ceil
        response_data = {
          data: ActiveModelSerializers::SerializableResource.new(titles, each_serializer: FlashcardSetTitlesSerializer),
          meta: {
          total_pages: total_title_pages,
          current_page: page
          }
        }
      render json: response_data

      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
    
    def types
      # byebug
      page = params[:page] || 1
      per_page = params[:per_page] || 10
      language = Language.find(params[:language])
      @total_type_pages ||= (language.flashcard_sets.select(:card_type).distinct.count.to_f / per_page).ceil
      
      card_types = FlashcardSet.select(:id, :title).distinct(:card_type).paginate(page: page, per_page: per_page).order(:id)
      response_data = {
        data: ActiveModelSerializers::SerializableResource.new(card_types, each_serializer: FlashcardSetTitlesSerializer),
        meta: {
          total_type_pages: @total_type_pages,
          current_page: page
        }
      } 
      render json: response_data
        rescue StandardError => e
          
            render json: {error: e.message}, status: :unprocessable_entity
    end


    private

  def find_flashcard_set
    @set = FlashcardSet.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "FlashcardSet not found" }, status: :not_found
  end
  def find_language
    language = Language.find(params[:language])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Language not found" }, status: :not_found
  end
end
