class FlashcardSetsController < ApplicationController
    before_action :find_flashcard_set, only: :update

    # before_action :find_language, except: :update
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
          render json: {data: []}, status: :ok
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
        content = language.flashcard_sets.where(completed: true)
        # filter options
        if content.exists?
            render json: content, status: :ok
        else
            render json: [], status: :ok
        end
    end

    # iterate thorugh pages if all completed page +1
    # if +1 doesnt exist stop
    def titles
      begin
        page = 1
        # byebug
        per_page = (params[:per_page].presence || 10).to_i
        card_types = params[:card_type]
        language = Language.find(params[:language])
        puts card_types
        puts language
        
        all_titles = language.flashcard_sets.i18n.where(card_type: card_types).order(:id)
    
        first_uncompleted = all_titles.find_by(completed: false)
        if params[:page].present?
          page = params[:page].to_i
        elsif first_uncompleted.present?
          
          index = all_titles.count {|title| title.id > first_uncompleted.id}
          page = (index / per_page.to_f).ceil
        end
    
        titles = all_titles.paginate(page: page, per_page: per_page)
        total_title_pages = (all_titles.count / per_page.to_f).ceil
    
        response_data = {
          data: ActiveModelSerializers::SerializableResource.new(titles, each_serializer: FlashcardSetTitlesSerializer),
          meta: {
            total_title_pages: total_title_pages,
            current_titles_page: page
          }
        }
        render json: response_data
    
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
    
    # eventually render completed titles % within

    # hacky solution
    # iterate through all records and return only unique values
    def types
      page = types_params[:page] || 1
      per_page = types_params[:per_page] || 10
      language = Language.find(types_params[:language])
    
      card_types = FlashcardSet.where(language_id: types_params[:language]).select(:id, :card_type, :completed).group(:id, :card_type)
    
      filtered_card_types = card_types.uniq { |card| card.card_type }
    
      paginated_card_types = filtered_card_types.slice((page.to_i - 1) * per_page.to_i, per_page.to_i)
    
      @total_type_pages ||= (filtered_card_types.count.to_f / per_page.to_i).ceil
    
      response_data = {
        data: ActiveModelSerializers::SerializableResource.new(paginated_card_types, each_serializer: FlashcardSetsTypesSerializer),
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
  def types_params
    params.permit(:language, :page, :per_page)
  end
end