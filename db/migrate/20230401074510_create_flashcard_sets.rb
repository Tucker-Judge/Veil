class CreateFlashcardSets < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcard_sets do |t|
      t.references :language, null: false, foreign_key: true
      t.boolean :completed
      t.integer :review_count
      
      t.timestamps
    end
  end
end
