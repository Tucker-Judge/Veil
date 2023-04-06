class Language < ApplicationRecord
    has_many :userlangs
    has_many :users, through: :userlangs
    has_many :flashcard_sets

    include Mobility
    translates :language, type: :text, backend: :key_value, fallbacks: {
        # fallbacks
        en: [],
        de: [:en],
        fr: [:en]
    }
end
