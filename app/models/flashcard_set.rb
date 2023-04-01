class FlashcardSet < ApplicationRecord
  belongs_to :language
  has_many :flashcards, dependent: :destroy
end
