class CmsController < ApplicationController
    before_action :authenticate_admin
    def vocab
        # handle translations
        # handle unfinished content
        # handle user error

        # check if the language already exists and if it should be edited
        language = Language.find_by(params[:language])
        
        if params[:card_type] === "Common Words"
            # grab last with common
            last = FlashcardSet.where(card_type: "Common Words").last
            real_last = last.title
            last = last.title.split(" ").last
            # divide num by 10 and + it to set_index
            for n in params[:back_arr]

                front = params[:front_arr]
                params[:back_arr].each_with_index do |back_arr, set_index| 
                    params[:translations].each do |locale|
                        Mobility.with_locale(locale) do |locale|
                            flashcard_set_check = Mobility.with_locale() {FlashcardSet.find_by(language_id: language, card_type: "Common Words")}
                    flashcard_set = FlashcardSet.create(language_id: language, card_type: "Common Words", title: "#{real_last}")
                    back_arr.each_with_index do |back_card, card_index| 
                        front_card = front.shift
                        if front_card.present?  && back_card.present?
                            Flashcard.create(flashcard_set_id: flashcard_set.id, front: front_card, back: back_card)
                        end
                    end
                    puts flashcard_set
                end
            end
            render json: { status: :created, message: 'alexa play sicko mode'}
        else 
            params[:back_arr].each_with_index do |sub,i|
                front = params[:front_arr]
                set = FlashcardSet.create(language_id: language.id, card_type: params[:card_type], title: params[:title])
                # 10.times do ||
                sub.each |n| do 
                    front_card = front.shift
                    back_card = params[:back_arr][i].shift
                    break unless front_card.present? && back_card.present?
                    Flashcard.create(flashcard_set_id: set.id, front: front_card, back: back_card)
                end
            end
            render json: set
        end
    end


    private

    def authenticate_admin
        unless current_user.admin?
            render json: {error: "dont let it happen again"},status: :unauthorized
    end
end
