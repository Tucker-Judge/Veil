class LanguageFlashcard < ApplicationRecord
  belongs_to :language
  belongs_to :flashcard
end
