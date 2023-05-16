class FlashcardSetTitlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :completed, :review_count
  
  has_many :flashcards

end
