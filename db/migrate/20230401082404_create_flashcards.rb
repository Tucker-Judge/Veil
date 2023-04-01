class CreateFlashcards < ActiveRecord::Migration[7.0]
  
  def change
    create_table :flashcards do |t|
      t.references :flashcard_set, null: false, foreign_key: true
      t.string :front
      t.jsonb :back
      t.string :type
      t.string :title

      t.timestamps
    end
    # is not letting repeating titles
    add_index :flashcards, [:type, :title], unique: true
  end
end
