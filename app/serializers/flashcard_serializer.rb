class FlashcardSerializer < ActiveModel::Serializer
  attributes :id, :front, :back, :type, :title
  has_one :flashcard_set
end
