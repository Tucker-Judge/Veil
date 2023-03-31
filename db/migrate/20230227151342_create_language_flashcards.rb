class CreateLanguageFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :language_flashcards do |t|
      t.string :title
      t.belongs_to :language, null: false, foreign_key: true
      t.belongs_to :flashcard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
