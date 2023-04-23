class Language < ApplicationRecord
    has_many :userlangs
    has_many :users, through: :userlangs
    has_many :flashcard_sets

    include Mobility
    translates :language, backend: :key_value, type: :text, fallbacks: {
        # fallbacks
        en: [:fr],
        de: [:en],
        fr: [:en]
    }
end
