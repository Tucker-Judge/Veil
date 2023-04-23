class Flashcard < ApplicationRecord
  belongs_to :flashcard_set

  include Mobility
    translates :back, backend: :key_value, type: :text, fallbacks: {
        # fallbacks
        en: [:fr],
        de: [:en],
        fr: [:en]
    }
end
