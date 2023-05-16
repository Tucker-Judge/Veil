class FlashcardSet < ApplicationRecord
  belongs_to :language
  has_many :flashcards, dependent: :destroy

  include Mobility
    translates :card_type, :title, backend: :key_value, type: :text, fallbacks: {
        # fallbacks
        en: [:fr],
        de: [:en],
        fr: [:en]
    }
    
end
