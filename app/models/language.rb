class Language < ApplicationRecord
    has_many :lessons
    has_many :users, through: :lessons
    has_many :language_flashcards
    has_many :flashcards, through: :language_flashcards
end
