class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.string :slug
      t.integer :status, default: 1, null: false
      t.jsonb :blockable_metadata, default: {}

      t.timestamps
    end
    add_index :posts, :slug, unique: true
    add_index :posts, :status
    add_index :posts, :blockable_metadata, using: :gin
  end
end
