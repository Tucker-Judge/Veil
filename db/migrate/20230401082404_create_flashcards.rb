class CreateFlashcards < ActiveRecord::Migration[7.0]
  
  def change
    create_table :flashcards do |t|
      t.references :flashcard_set, null: false, foreign_key: true
      t.string :front
      t.jsonb :back

      t.timestamps
    end
  end
end
