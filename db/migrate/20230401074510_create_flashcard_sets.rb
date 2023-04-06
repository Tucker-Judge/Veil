class CreateFlashcardSets < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcard_sets do |t|
      t.references :language, null: false, foreign_key: true
      t.boolean :completed, default: false, null: false
      t.integer :review_count, default: 0, null: false
      t.string :card_type
      t.string :title
      
      t.timestamps
    end
    # User creation of sets
    # add_index :flashcards_sets, [:user_id, :title], unique: true, name: 'index_your_table_name_on_user_id_and_title'
    # add_index :flashcards_sets, :title, unique: true, where: 'user_id IS NULL', name: 'index_your_table_name_on_title_without_user_id'
  end
  # users can create a set 
  # first set with title will create the type 
end
