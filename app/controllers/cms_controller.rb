class CmsController < ApplicationController
    before_action :authenticate_admin
    def vocab
        # handle translations
        # handle unfinished content
        # handle user error

        language = Language.find_by(params[:language])
        if params[:card_type] === "Common Words"

            front = params[:front_arr]
            for n in params[:back_arr]
                params[:back_arr].each_with_index do |back_arr, set_index| 
                    params[:translations].each do |locale|
                        I18n.with_locale(locale.to_sym) do
                            # 
                            flashcard_set_check = FlashcardSet.find_by(language_id: language, card_type: "Common Words")
                            # i18n scope check flashcard_set_check
                            if flashcard_set_check.exists?
                                flashcard_set_check.title = "Some way of setting language values"
                                # card_type
                                flashcard_set_check.flashcards.each do |flashcard, card_index|
                                    flashcard.back = back_arr.shift
                                end
                            else 
                                # card_type becomes params[:card_type] to set proper language values
                                flashcard_set = FlashcardSet.create(language_id: language, card_type: "Common Words", title: "#{real_last + 10}")
                            # if it exists then stop else 
                            end
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
                end
            end
        else 
            # I cant wait to do this all day
            params[:back_arr].each_with_index do |sub,i|
                front = params[:front_arr]
                set = FlashcardSet.create(language_id: language.id, card_type: params[:card_type], title: params[:title])
                sub.each |n| do 
                    front_card = front.shift
                    back_card = params[:back_arr][i].shift
                    break unless front_card.present? && back_card.present?
                    if flashcard.find_by(front: front_card).exists?
                        I18n.with_locale(params[:translations].shift.to_sym) {card.back = back_card}
                    else
                        card = Flashcard.create(flashcard_set_id: set.id, front: front_card)
                        I18n.with_locale(params[:translations].shift.to_sym) {card.back = back_card}
                    end
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
