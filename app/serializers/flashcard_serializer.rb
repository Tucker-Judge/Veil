# class FlashcardSerializer < ActiveModel::Serializer
#   attributes :id, :genre, :cover_info, :front, :back
#   has_one :language
#   def one_back(attribute, userlang)
#     {back: object.attribute[userlang]}
#   end
# end


  class FlashcardSerializer < ActiveModel::Serializer
    attributes :id, :genre, :cover_info, :front, :back, :one_back, :completed
  
    def one_back
      if object.respond_to?(:flashcard) && object.flashcard.present?
        object.flashcard.back[instance_options[:lang_key]]
      elsif object.respond_to?(:back) && object.back.present?
        object.back[instance_options[:lang_key]]
      end
    end
    
  
    
    

  
  
end
