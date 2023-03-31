class Flashcard < ApplicationRecord
  has_many :language_flashcards
  has_many :languages, through: :language_flashcards
end
