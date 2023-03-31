class TitlesJoinedSerializer < ActiveModel::Serializer
  attributes :id, :titles
 


  
    def titles
      object.flashcards.map(&:title).uniq
    end
  
end
