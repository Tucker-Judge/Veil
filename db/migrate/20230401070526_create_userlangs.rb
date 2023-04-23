class CreateUserlangs < ActiveRecord::Migration[7.0]
  def change
    create_table :userlangs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.boolean :learning, default: true
    end
  end
end
