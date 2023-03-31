class CreateFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcards do |t|
      t.string :genre
      t.jsonb :cover_info
      t.string :front
      t.jsonb :back
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
