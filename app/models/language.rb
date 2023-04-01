class Language < ApplicationRecord
    has_many :userlangs
    has_many :users, through: :userlangs
    has_many :flashcard_sets
end
