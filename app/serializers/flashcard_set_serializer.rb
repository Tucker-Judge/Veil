class FlashcardSetSerializer < ActiveModel::Serializer
  attributes :id, :completed, :review_count, :card_type, :title
  # has_one :language
  has_many :flashcards
end
